import 'package:flutter/material.dart';

class Category {
  final String name;
  final String imagePath;

  Category({required this.name, required this.imagePath});
}

final List<Category> categories = [
  Category(name: 'Top Offers', imagePath: 'assets/images/offer.webp'),
  Category(name: 'Mobiles', imagePath: 'assets/images/phone.webp'),
  Category(name: 'Fashion', imagePath: 'assets/images/fashion.webp'),
  Category(name: 'Electronics', imagePath: 'assets/images/electronics.webp'),
  Category(name: 'Home', imagePath: 'assets/images/kitchen.webp'),
  Category(name: 'Personal Care', imagePath: 'assets/images/beauty.webp'),
  Category(name: 'Appliances', imagePath: 'assets/images/washing.webp'),
  Category(name: 'Toys & Baby', imagePath: 'assets/images/toys.jpeg'),
  Category(name: 'Furniture', imagePath: 'assets/images/furniture.webp'),
  Category(name: 'Flights & Hotels', imagePath: 'assets/images/flight.webp'),
  Category(name: 'Insurance', imagePath: 'assets/images/insurance.png'),
  Category(name: 'Sports', imagePath: 'assets/images/sport.png'),
  Category(name: 'Nutrition & more', imagePath: 'assets/images/nuutrition.jpeg'),
  Category(name: 'Bikes & Cars', imagePath: 'assets/images/car.jpeg'),
  Category(name: 'Gift Cards', imagePath: 'assets/images/gift card.jpeg'),
  Category(name: 'Medicines', imagePath: 'assets/images/medicine.jpeg'),
  Category(name: 'Home Services', imagePath: 'assets/images/service.jpeg'),
  Category(name: 'Sell-Back', imagePath: 'assets/images/sell.png'),
];


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white, // ✅ Add this line
        title: const Text('All Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 4,
        padding: const EdgeInsets.all(8.0),
        children: List.generate(categories.length, (index) {
          return _buildCategoryItem(categories[index]);
        }),
      ),
    );
  }

  Widget _buildCategoryItem(Category category) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(category.imagePath),
        ),
        const SizedBox(height: 8),
        Text(
          category.name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}