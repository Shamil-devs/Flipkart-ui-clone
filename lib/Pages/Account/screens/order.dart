import 'package:flutter/material.dart';

// A simple data model for an order
class Order {
  final String status;
  final String date;
  final String title;
  final String imageUrl;

  Order({
    required this.status,
    required this.date,
    required this.title,
    required this.imageUrl,
  });
}

// Sample data for the list
final List<Order> myOrders = [
  Order(status: 'Delivered', date: 'Dec 26, 2022', title: 'realme C30 (Denim Black, 32 GB)', imageUrl: 'assets/images/mobile1.jpeg'),
  Order(status: 'Delivered', date: 'Dec 26, 2022', title: 'Discovery+ 25% off on annual sub...', imageUrl: 'assets/images/mobile2.jpeg'),
  Order(status: 'Cancelled', date: 'Dec 22, 2022', title: 'realme C30 (Lake Blue, 32 GB)', imageUrl: 'assets/images/mobile3.jpeg'),
  Order(status: 'Delivered', date: 'Dec 16, 2022', title: 'OPPO F19 Pro+ 5G (Space Silver, 128 GB)', imageUrl: 'assets/images/mobile4.jpeg'),
];

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: Column(
        children: [
          // Search and Filter Bar
          _buildSearchAndFilterBar(),

          // Order List
          Expanded(
            child: ListView.builder(
              itemCount: myOrders.length,
              itemBuilder: (context, index) {
                return _buildOrderItem(myOrders[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper for the search bar
  Widget _buildSearchAndFilterBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search your order here',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          const SizedBox(width: 8),
          TextButton.icon(
            icon: const Icon(Icons.filter_list),
            label: const Text('Filters'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  // Helper for a single order item card
  Widget _buildOrderItem(Order order) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.asset(order.imageUrl, width: 60, height: 60),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${order.status} on ${order.date}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: order.status == 'Cancelled' ? Colors.red : Colors.green,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(order.title, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}