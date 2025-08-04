import 'package:flutter/material.dart';
class CartItem {
  final String name;
  final String size;
  final String imageUrl;
  final double rating;
  final int originalPrice;
  final int discountedPrice;
  final String deliveryBy;

  CartItem({
    required this.name,
    required this.size,
    required this.imageUrl,
    required this.rating,
    required this.originalPrice,
    required this.discountedPrice,
    required this.deliveryBy,
  });
}

final List<CartItem> cartItems = [
  CartItem(
    name: 'KETCH Full Sleeve Solid Men Jacket',
    size: 'S',
    imageUrl: 'assets/images/jacket.jpeg',
    rating: 4.1,
    originalPrice: 3149,
    discountedPrice: 1200,
    deliveryBy: 'Thu Mar 9',
  ),
  CartItem(
    name: 'WALLSTICK 72 cm Life quotes (80 x 20 c...',
    size: 'Pack of 1',
    imageUrl: 'assets/images/wallstick.jpeg',
    rating: 3.8,
    originalPrice: 699,
    discountedPrice: 169,
    deliveryBy: 'Mon Mar 6',
  ),
];

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Flipkart (6)'),
              Tab(text: 'Grocery'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCartList(),
            const Center(child: Text('Grocery Cart is empty')),
          ],
        ),
        bottomNavigationBar: _buildPlaceOrderBar(),
      ),
    );
  }

  Widget _buildCartList() {
    return ListView(
      children: [
        _buildDeliveryAddress(),
        const Divider(),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return _buildCartItem(cartItems[index]);
          },
          separatorBuilder: (context, index) => const Divider(thickness: 4, color: Color(0xFFF1F3F6)),
        ),
      ],
    );
  }

  Widget _buildDeliveryAddress() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text('Deliver to: Muhammed shamil, 679324'),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child:
                      const Text('HOME', style: TextStyle(fontSize: 10)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text('Koorimannil HOUSE, Kadannamanna po,Mankada'),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Change'),
          ),
        ],
      ),
    );
  }
  Widget _buildCartItem(CartItem item) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(item.imageUrl, width: 80, height: 80),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('Size: ${item.size}'),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.green, size: 16),
                        Text('${item.rating}'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('₹${item.discountedPrice}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 8),
                        Text('₹${item.originalPrice}', style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey)),
                        const SizedBox(width: 8),
                        Text('${((item.originalPrice - item.discountedPrice) / item.originalPrice * 100).toStringAsFixed(0)}% off', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Text('4 offers applied • 2 offers available', style: TextStyle(color: Colors.green, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4)
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    value: 1,
                    items: [1, 2, 3, 4, 5].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text('Qty: $value'),
                      );
                    }).toList(),
                    onChanged: (newValue) {},
                  ),
                ),
              ),
              const Spacer(),
              TextButton.icon(
                icon: const Icon(Icons.bookmark_border, size: 20),
                label: const Text('Save for later'),
                onPressed: () {},
              ),
              TextButton.icon(
                icon: const Icon(Icons.delete_outline, size: 20),
                label: const Text('Remove'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceOrderBar() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('₹4,840', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('View price details', style: TextStyle(color: Colors.blue)),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber[700],
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            ),
            child: const Text('Place order'),
          ),
        ],
      ),
    );
  }
}