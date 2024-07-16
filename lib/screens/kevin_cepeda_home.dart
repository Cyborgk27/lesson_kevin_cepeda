import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:xml/xml.dart' as xml;

class KevinCepedaHome extends StatefulWidget {
  const KevinCepedaHome({super.key});

  @override
  State<KevinCepedaHome> createState() => _KevinCepedaHomeState();
}

class _KevinCepedaHomeState extends State<KevinCepedaHome> {
  List<Restaurant> restaurants = [];

  @override
  void initState() {
    super.initState();
    _loadRestaurants();
  }

  Future<void> _loadRestaurants() async {
    try {
      final String xmlString = await rootBundle.loadString('assets/restaurants.xml');
      final xml.XmlDocument document = xml.XmlDocument.parse(xmlString);
      final List<xml.XmlElement> restaurantElements = document.findAllElements('restaurant').toList();

      setState(() {
        restaurants = restaurantElements.map((element) {
          final name = element.findElements('name').single.text;
          final country = element.findElements('country').single.text;
          final description = element.findElements('description').single.text;
          final imageUrl = element.findElements('image_url').single.text;
          return Restaurant(name: name, country: country, description: description, imageUrl: imageUrl);
        }).toList();
      });
    } catch (e) {
      print('Error cargando restaurantes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Restaurantes'),
      ),
      body: restaurants.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        restaurant.imageUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          restaurant.name,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          restaurant.description,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'País: ${restaurant.country}',
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'login');
              },
              child: const Icon(Icons.keyboard_return),
            ),
    );
  }
}

class Restaurant {
  final String name;
  final String country;
  final String description;
  final String imageUrl;

  Restaurant({
    required this.name,
    required this.country,
    required this.description,
    required this.imageUrl,
  });
}