import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vmart/models/boxeddeals.dart';
import 'package:vmart/models/survival_model.dart';
import 'package:vmart/screens/categorie_screen.dart';
import 'package:vmart/screens/profile_screen.dart';
import 'package:vmart/screens/search_screen.dart';
import 'package:vmart/services/boxeddeals_service.dart';
import 'package:vmart/services/suvival_service.dart';
import 'package:vmart/widgets/Features_widget.dart';

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
      floatingActionButton: SpeedDial(
        activeBackgroundColor: const Color.fromARGB(255, 130, 247, 241),
        icon: Icons.message,
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 15, 206, 171),
        children: [
          SpeedDialChild(
            backgroundColor: const Color.fromARGB(255, 15, 206, 171),
            child: const Icon(
              Icons.notification_add,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          SpeedDialChild(
            backgroundColor: const Color.fromARGB(255, 15, 206, 171),
            child: const Icon(
              Icons.email,
              color: Colors.white,
            ),
            onTap: () {},
          ),
          SpeedDialChild(
            backgroundColor: const Color.fromARGB(255, 15, 206, 171),
            child: const Icon(
              Icons.call,
              color: Colors.white,
            ),
            onTap: () {},
          ),
        ],
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
      backgroundColor: Colors.white,
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
              const Featured(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Survival Essentials ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: TextButton(
                        onPressed: () {
                          print("View All");
                        },
                        child: const Text(
                          "View All",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Survival(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Boxed Deals ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 10),
                      child: TextButton(
                        onPressed: () {
                          print("View All");
                        },
                        child: const Text(
                          "View All",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Boxed(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Purrfectly Deliccius ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: TextButton(
                        onPressed: () {
                          print("View All");
                        },
                        child: const Text(
                          "View All",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Purrfectly()
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

class Purrfectly extends StatelessWidget {
  const Purrfectly({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}

//Boxed=============================================================================
class Boxed extends StatefulWidget {
  const Boxed({super.key});

  @override
  State<Boxed> createState() => _BoxedState();
}

class _BoxedState extends State<Boxed> {
  late Future<List<Boxeddeals>> _boxedState;

  @override
  void initState() {
    super.initState();
    _boxedState = loadBoxeddealItems();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Boxeddeals>>(
      future: _boxedState,
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshots.hasError) {
          return Center(
            child: Text('Error: ${snapshots.error}'),
          );
        } else if (!snapshots.hasData || snapshots.data!.isEmpty) {
          return const Center(
            child: Text('No Survival Essentials'),
          );
        } else {
          final boxedStateItems = snapshots.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: boxedStateItems.map((boxedStateItem) {
                return buildBoxedStateCard(boxedStateItem);
              }).toList(),
            ),
          );
        }
      },
    );
  }

  Widget buildBoxedStateCard(Boxeddeals boxedStateItem) {
    bool isAddedToCart = boxedStateItem.addToCart;
    return Column(
      children: [
        Card(
          shape: const RoundedRectangleBorder(),
          child: Container(
            width: 150,
            height: 230,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          boxedStateItem.favorite = !boxedStateItem.favorite;
                        });
                        print(boxedStateItem.favorite
                            ? "Added to favorites"
                            : "Removed from favorites");
                      },
                      icon: const Icon(Icons.favorite),
                      color: boxedStateItem.favorite
                          ? Colors.grey[200]
                          : const Color.fromARGB(255, 15, 206, 171),
                    ),
                  ],
                ),
                Expanded(
                  child: Image.network(
                    boxedStateItem.image,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(boxedStateItem.volume),
                ),
                Container(
                  color: Colors.grey[400],
                  width: 150,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isAddedToCart = !isAddedToCart;
                        boxedStateItem.addToCart = isAddedToCart;
                      });
                      print(isAddedToCart
                          ? "Added to cart"
                          : "Removed from cart");
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        isAddedToCart
                            ? Colors.grey[400]
                            : const Color.fromARGB(255, 15, 206, 171),
                      ),
                      shadowColor: null,
                      backgroundBuilder: null,
                      shape: WidgetStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                    ),
                    child: const Text(
                      "ADD TO CART",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  boxedStateItem.name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Text(
                      "${boxedStateItem.localValue.toStringAsFixed(2)} ${boxedStateItem.localCutrrency}",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 15, 206, 171),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "${boxedStateItem.convertedValue.toStringAsFixed(2)} ${boxedStateItem.covertedCurremcy}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

//survival class====================================================================================================
class Survival extends StatefulWidget {
  const Survival({super.key});

  @override
  State<Survival> createState() => _SurvivalState();
}

class _SurvivalState extends State<Survival> {
  late Future<List<SurvivalModel>> _survivalstate;

  @override
  void initState() {
    super.initState();
    _survivalstate = loadSurvivalItems();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SurvivalModel>>(
      future: _survivalstate,
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshots.hasError) {
          return Center(child: Text('Error: ${snapshots.error}'));
        } else if (!snapshots.hasData || snapshots.data!.isEmpty) {
          return const Center(child: Text('No Survival Essentials'));
        } else {
          final survivalItems = snapshots.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: survivalItems.map((survivalItem) {
                return _buildSurvivalCard(survivalItem);
              }).toList(),
            ),
          );
        }
      },
    );
  }

  Widget _buildSurvivalCard(SurvivalModel survivalItem) {
    bool isAddedToCart = survivalItem.addToCart;

    return Column(
      children: [
        Card(
          shape: const RoundedRectangleBorder(),
          child: Container(
            width: 150,
            height: 230,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          survivalItem.favoritte = !survivalItem.favoritte;
                        });
                        print(survivalItem.favoritte
                            ? "Added to favorites"
                            : "Removed from favorites");
                      },
                      icon: const Icon(Icons.favorite),
                      color: survivalItem.favoritte
                          ? Colors.grey[200]
                          : const Color.fromARGB(255, 15, 206, 171),
                    ),
                  ],
                ),
                Expanded(
                  child: Image.network(
                    survivalItem.image,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(survivalItem.volume),
                ),
                Container(
                  color: Colors.grey[400],
                  width: 150,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isAddedToCart = !isAddedToCart;
                        survivalItem.addToCart = isAddedToCart;
                      });
                      print(isAddedToCart
                          ? "Added to cart"
                          : "Removed from cart");
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        isAddedToCart
                            ? Colors.grey[400]
                            : const Color.fromARGB(255, 15, 206, 171),
                      ),
                      shadowColor: null,
                      backgroundBuilder: null,
                      shape: WidgetStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                    ),
                    child: const Text(
                      "ADD TO CART",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  survivalItem.name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Text(
                      "${survivalItem.localValue.toStringAsFixed(2)} ${survivalItem.localCurrency}",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 15, 206, 171),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "${survivalItem.convertedValue.toStringAsFixed(2)} ${survivalItem.convertedCurrency}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
