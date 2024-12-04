import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vmart/models/categorie_model.dart';
import 'package:vmart/screens/categorie_screen.dart';
import 'package:vmart/screens/profile_screen.dart';
import 'package:vmart/screens/search_screen.dart';
import 'package:vmart/services/catgorie_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    const HomeContentScreen(),
    const Categories(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 206, 171),
        toolbarHeight: 85,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 70,
              height: 150,
              child: Image.asset(
                "lib/assets/images/logo.png",
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 15, 206, 171),
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: Color.fromARGB(255, 15, 206, 171),
          ),
          Icon(
            Icons.category,
            size: 30,
            color: Color.fromARGB(255, 15, 206, 171),
          ),
          Icon(
            Icons.search,
            size: 30,
            color: Color.fromARGB(255, 15, 206, 171),
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Color.fromARGB(255, 15, 206, 171),
          ),
        ],
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 15, 206, 171),
        onPressed: () {},
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      body: _screens[_currentIndex],
    );
  }
}

class HomeContentScreen extends StatefulWidget {
  const HomeContentScreen({super.key});

  @override
  State<HomeContentScreen> createState() => _HomeContentScreenState();
}

class _HomeContentScreenState extends State<HomeContentScreen> {
  int _currentIndex = 0;
  final List<String> _imageUrls = [
    "https://i.pinimg.com/736x/a9/ef/e4/a9efe4c4bb6da39b23036180afcf76ef.jpg",
    "https://i.pinimg.com/736x/fc/23/62/fc2362f0020d7e76f6e9796820c7ce12.jpg",
    "https://i.pinimg.com/736x/f2/65/46/f265466d0aa91a3ec00d64e4004fd038.jpg",
    "https://i.pinimg.com/474x/1f/e4/bd/1fe4bd93c8b7686bdbc8bc9da84d27ba.jpg",
    "https://i.pinimg.com/736x/24/0f/8f/240f8f45c55c96407974950c97edfff3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                color: const Color.fromARGB(255, 163, 236, 223),
                child: const Center(
                    child: Text("Exchamge Rate : 1 USD =4500 Real")),
              ),
              CarouselSlider(
                items:
                    _imageUrls.map((url) => _buildCarouselItem(url)).toList(),
                options: CarouselOptions(
                  height: 300.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              SmoothPageIndicator(
                controller: PageController(initialPage: _currentIndex),
                count: _imageUrls.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 8.0,
                  dotWidth: 10.0,
                  activeDotColor: Color.fromARGB(255, 15, 206, 171),
                  dotColor: Colors.grey,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Featured Categories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Featured()
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(String imageUrl) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Featured extends StatefulWidget {
  const Featured({Key? key}) : super(key: key);

  @override
  State<Featured> createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  late Future<List<Category>> _categories;

  @override
  void initState() {
    super.initState();
    _categories = loadCategories(); // Load the categories
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: _categories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No categories found.'));
        } else {
          final categories = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Image.network(
                          category.image,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        category.title,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
