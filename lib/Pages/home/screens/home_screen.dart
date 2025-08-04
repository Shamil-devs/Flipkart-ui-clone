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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAppBar(),
            _buildPromoBanner(),
            _buildServicesIcons(),
            const SizedBox(height: 10),
            _buildOfferCards(),
            const SizedBox(height: 20),
            _buildRecentlyViewed(),
          ],
        ),
      ),

       );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 8, right: 8, bottom: 8),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
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
                  const SizedBox(height: 6),
                  Container(
                    width: 60,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
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

  Widget _buildOfferCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Expanded(child: _buildDealCard('Laptop Deals\nFrom ₹14,990',
                Image.asset('assets/images/lap.jpeg'))),

            const SizedBox(width: 8),

            Expanded(child: _buildDealCard('Extra ₹75 Off\nSale is Live',
                Image.asset('assets/images/gocery.webp'))),

            const SizedBox(width: 8),

            Expanded(child: _buildDealCard('BT Calling | 1.83"\nSale Price ₹1,499',
                Image.asset('assets/images/watch.jpeg'))),
          ],
        ),
    );
  }

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
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _recentlyViewedImages.length,
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