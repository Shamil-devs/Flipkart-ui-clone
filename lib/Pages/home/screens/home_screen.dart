import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FlipkartHomeScreen extends StatefulWidget {
  const FlipkartHomeScreen({super.key});

  @override
  State<FlipkartHomeScreen> createState() => _FlipkartHomeScreenState();
}

class _FlipkartHomeScreenState extends State<FlipkartHomeScreen> {
  int _selectedIndex = 0;
  final List<String> _bannerImages = [
    'assets/images/banner1.jpeg',
    'assets/images/banner2.jpeg',
    'assets/images/banner3.jpeg',
  ];
  // Add this list inside your state class
  final List<String> _recentlyViewedImages = [
    'assets/images/mob1.webp',
    'assets/images/mob2.webp',
    'assets/images/mob3.webp',
    'assets/images/mob4.webp',
    'assets/images/mob5.webp',
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The body is wrapped in a SingleChildScrollView to make it scrollable
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Custom App Bar Section
            _buildAppBar(),

            // 2. Promotional Banner
            _buildPromoBanner(),

            // 3. Services Icons
            _buildServicesIcons(),

            // Add some spacing
            const SizedBox(height: 10),

            // 4. Offer Cards
            _buildOfferCards(),

            // Add some spacing
            const SizedBox(height: 20),

            // 5. Recently Viewed Section
            _buildRecentlyViewed(),
          ],
        ),
      ),

       );
  }

  // Widget for the Custom App Bar
  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 8, right: 8, bottom: 8),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              // Flipkart Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/Flipkart Logo.png',
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                      const Text('Flipkart'),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 8.0),

              // Grocery Button
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/Grocery logo.png',
                    height: 20,
                  ),
                  label: const Text('Grocery'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: Colors.black54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Search Bar
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Brand Mall',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6), // Spacing between text and switch
                  Container(
                    width: 60,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        // OFF Text
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              'OFF',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        // Knob
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.all(3),
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),


              const SizedBox(width: 8),

              Expanded(
                child: Container(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for products',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  //Banner
  // Widget for the Promotional Banner
  Widget _buildPromoBanner() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 16/9,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      items: _bannerImages.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  // Widget for the Service Icons Grid
  Widget _buildServicesIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIconColumn(Icons.flash_on, 'SuperCoin'),
          _buildIconColumn(Icons.receipt, 'Coupons'),
          _buildIconColumn(Icons.add_circle, 'Plus'),
          _buildIconColumn(Icons.credit_card, 'Credit'),
          _buildIconColumn(Icons.people, 'Group Buy'),
        ],
      ),
    );
  }

  // Helper for creating a single icon with a label
  Widget _buildIconColumn(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.lightBlue[50],
          child: Icon(icon, color: Colors.blue[800]),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  // Widget for the Offer Cards
  Widget _buildOfferCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            // Laptop Deal Card - uses Image.asset
            Expanded(child: _buildDealCard('Laptop Deals\nFrom ₹14,990',
                Image.asset('assets/images/lap.jpeg'))),

            const SizedBox(width: 8),

            // Extra Off Card - uses Image.network
            Expanded(child: _buildDealCard('Extra ₹75 Off\nSale is Live',
                Image.asset('assets/images/gocery.webp'))),

            const SizedBox(width: 8),

            // BT Calling Card - uses Image.network
            Expanded(child: _buildDealCard('BT Calling | 1.83"\nSale Price ₹1,499',
                Image.asset('assets/images/watch.jpeg'))),
          ],
        ),
    );
  }

// Helper for creating a single deal card
  Widget _buildDealCard(String text, Widget imageWidget) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: imageWidget,
            ),
            const SizedBox(height: 8),
            Text(text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  // Widget for Recently Viewed Section
  Widget _buildRecentlyViewed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Recently Viewed Stores',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150, // Fixed height for the horizontal list
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _recentlyViewedImages.length,
            // This builds each image card
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  width: 100,
                  child: Image.asset(
                    _recentlyViewedImages[index],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 8),
          ),
        )
      ],
    );
  }

  // Helper for a single recently viewed item
  Widget _buildRecentItem(String imageUrl) {
    return Card(
      margin: const EdgeInsets.only(right: 10),
      child: Container(
        width: 100,
        child: Image.network(imageUrl, fit: BoxFit.contain),
      ),
    );
  }
}