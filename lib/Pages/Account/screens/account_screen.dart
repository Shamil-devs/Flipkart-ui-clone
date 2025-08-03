import 'package:flutter/material.dart';
import 'package:flipkart_clone/Pages/Account/screens/order.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildGridButtons(context),
            const SizedBox(height: 10),
            _buildSectionHeader('Credit Options'),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  _buildListTile(Icons.calendar_today, 'Flipkart Pay Later', 'Complete application & get ₹500* gift card'),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  _buildListTile(Icons.credit_card, 'Flipkart Axis Bank Credit Card', null),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildPromoBanner(),
            const SizedBox(height: 10),
            _buildSectionHeader('Account Settings'),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  _buildListTile(Icons.add_circle_outline, 'Flipkart Plus', null),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  _buildListTile(Icons.person_outline, 'Edit Profile', null),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  _buildListTile(Icons.language, 'Select Language', null),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  _buildListTile(Icons.notifications_outlined, 'Notification Settings', null),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildSectionHeader('My Activity'),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  _buildListTile(Icons.rate_review_outlined, 'Reviews', null),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  _buildListTile(Icons.message_outlined, 'Questions & Answers', null),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildSectionHeader('Earn with Flipkart'),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  _buildListTile(Icons.star_border, 'Flipkart Creator Studio', null),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  _buildListTile(Icons.storefront_outlined, 'Sell on Flipkart', null),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildSectionHeader('Feedback & Information'),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  _buildListTile(Icons.article_outlined, 'Terms, Policies and Licenses', null),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  _buildListTile(Icons.help_outline, 'Browse FAQs', null),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('Log Out'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                  backgroundColor: Colors.white),
                ),
              ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hey! Muhammed shamil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text('Explore', style: TextStyle(color: Colors.white70)),
                      SizedBox(width: 4),
                      Text('Flipkart Plus', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.yellow)),
                      Icon(Icons.chevron_right, color: Colors.yellow, size: 16),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Chip(
                backgroundColor: Colors.yellow[700],
                avatar: const Icon(Icons.flash_on, color: Colors.blue),
                label: const Text('711', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridButtons(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.shopping_bag_outlined, color: Colors.blue),
                  label: const Text('Orders', style: TextStyle(color: Colors.black87)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyOrdersScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(child: _buildOutlinedButton(Icons.favorite_border, 'Wishlist')), // This remains the same
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _buildOutlinedButton(Icons.card_giftcard, 'Coupons')),
              const SizedBox(width: 8),
              Expanded(child: _buildOutlinedButton(Icons.headset_mic_outlined, 'Help Center')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOutlinedButton(IconData icon, String label) {
    return OutlinedButton.icon(
      icon: Icon(icon, color: Colors.blue),
      label: Text(label, style: const TextStyle(color: Colors.black87)),
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54)),
    );
  }

  Widget _buildListTile(IconData icon, String title, String? subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle, style: const TextStyle(fontSize: 12)) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  Widget _buildPromoBanner() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.asset('assets/images/account.jpeg'),
          ListTile(
            title: const Text('Level Up and win rewards worth Rs.10000'),
            subtitle: const Text('Only 1 more tasks to complete this level'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          )
        ],
      ),
    );
  }
}