import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vmart/models/boxeddeals.dart';
import 'package:vmart/models/newproduct_model.dart';
import 'package:vmart/models/purrfectly_model.dart';
import 'package:vmart/models/survival_model.dart';
import 'package:vmart/models/weeklyoffers_model.dart';
import 'package:vmart/screens/categorie_screen.dart';
import 'package:vmart/screens/profile_screen.dart';
import 'package:vmart/screens/search_screen.dart';
import 'package:vmart/services/boxeddeals_service.dart';
import 'package:vmart/services/freshpicks_service.dart';
import 'package:vmart/services/newproduct_service.dart';
import 'package:vmart/services/purrfectly_service.dart';
import 'package:vmart/services/suvival_service.dart';
import 'package:vmart/services/weeklyoffers_service.dart';
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
              const Purrfectly(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Weekly Offers",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55, vertical: 10),
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
              const Weeklyoffers(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "New Products",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55, vertical: 10),
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
              const NewProduct(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Fresh Picks",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55, vertical: 10),
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
              const FreshPicks()
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

class FreshPicks extends StatefulWidget {
  const FreshPicks({super.key});

  @override
  State<FreshPicks> createState() => _FreshPicksState();
}

class _FreshPicksState extends State<FreshPicks> {
  late Future<List<Boxeddeals>> _freshPicks;

  @override
  void initState() {
    super.initState();
    _freshPicks = loadFreshPicks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Boxeddeals>>(
      future: _freshPicks,
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshots.hasError) {
          return Center(child: Text('Error: ${snapshots.error}'));
        } else if (!snapshots.hasData || snapshots.data!.isEmpty) {
          return const Center(child: Text("No Survival Essentials"));
        } else {
          final freshPicksItems = snapshots.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: freshPicksItems.map((freshPickItem) {
                return FreshPicksCard(
                  boxedStateItem: freshPickItem,
                  onFavoriteToggle: () {
                    setState(() {
                      freshPickItem.favorite = !freshPickItem.favorite;
                    });
                    print(freshPickItem.favorite
                        ? "Added to favorites"
                        : "Removed from favorites");
                  },
                  onAddToCartToggle: () {
                    setState(() {
                      freshPickItem.addToCart = !freshPickItem.addToCart;
                    });
                    print(freshPickItem.addToCart
                        ? "Added to cart"
                        : "Removed from cart");
                  },
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}

class FreshPicksCard extends StatelessWidget {
  final Boxeddeals boxedStateItem;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onAddToCartToggle;

  const FreshPicksCard({
    required this.boxedStateItem,
    required this.onFavoriteToggle,
    required this.onAddToCartToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                      onPressed: onFavoriteToggle,
                      icon: Icon(Icons.favorite,
                          color: boxedStateItem.favorite
                              ? Colors.grey[200]
                              : Color.fromARGB(255, 15, 206, 171)),
                    ),
                  ],
                ),
                Expanded(
                  child: Image.network(
                    boxedStateItem.image,
                    fit: BoxFit.cover,
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
                    onPressed: onAddToCartToggle,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          boxedStateItem.addToCart
                              ? Colors.grey[400]!
                              : Color.fromARGB(255, 15, 206, 171)),
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                    child: Text(
                      "ADD TO CART",
                      style: const TextStyle(color: Colors.white),
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
                  style: const TextStyle(fontSize: 16),
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
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NewProduct extends StatefulWidget {
  const NewProduct({
    super.key,
  });

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  late Future<List<NewproductModel>> _newproduct;

  @override
  void initState() {
    super.initState();
    _newproduct = loadnewproduct();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewproductModel>>(
      future: _newproduct,
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshots.hasError) {
          return Center(child: Text('Error: ${snapshots.error}'));
        } else if (!snapshots.hasData || snapshots.data!.isEmpty) {
          return const Center(child: Text("No Survival Essentials"));
        } else {
          final newProductItems = snapshots.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: newProductItems.map((newProductItem) {
                return NewProductCard(
                  item: newProductItem,
                  onFavoriteToggle: () {
                    setState(() {
                      newProductItem.favoritte = !newProductItem.favoritte;
                    });
                  },
                  onAddToCartToggle: () {
                    setState(() {
                      newProductItem.addToCart = !newProductItem.addToCart;
                    });
                  },
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}

class NewProductCard extends StatelessWidget {
  final NewproductModel item;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onAddToCartToggle;

  const NewProductCard({
    Key? key,
    required this.item,
    required this.onFavoriteToggle,
    required this.onAddToCartToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      onPressed: onFavoriteToggle,
                      icon: Icon(Icons.favorite,
                          color: item.favoritte
                              ? Colors.grey[200]
                              : const Color.fromARGB(255, 15, 206, 171)),
                    ),
                  ],
                ),
                Expanded(
                  child: Image.network(item.image),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(item.volume),
                ),
                Container(
                  color: Colors.grey[400],
                  width: 150,
                  height: 50,
                  child: TextButton(
                    onPressed: onAddToCartToggle,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        item.addToCart
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
                      style: TextStyle(color: Colors.white),
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
                  item.name,
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
                      "${item.localValue.toStringAsFixed(2)} ${item.localCurrency}",
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
                    "${item.convertedValue.toStringAsFixed(2)} ${item.convertedCurrency}",
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

class Weeklyoffers extends StatefulWidget {
  const Weeklyoffers({super.key});

  @override
  State<Weeklyoffers> createState() => _WeeklyoffersState();
}

class _WeeklyoffersState extends State<Weeklyoffers> {
  late Future<List<WeeklyoffersModel>> __weeklyoffersmodel;

  @override
  void initState() {
    super.initState();
    __weeklyoffersmodel = loadweeklyoffers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WeeklyoffersModel>>(
      future: __weeklyoffersmodel,
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshots.hasError) {
          return Center(child: Text('Error: ${snapshots.error}'));
        } else if (!snapshots.hasData || snapshots.data!.isEmpty) {
          return const Center(child: Text("No Survival Essentials"));
        } else {
          final weeklyOfferItems = snapshots.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: weeklyOfferItems.map((item) {
                return BuildWeeklyCard(
                  item: item,
                  onFavoriteToggle: () {
                    setState(() {
                      item.favorite = !item.favorite;
                    });
                  },
                  onAddToCartToggle: () {
                    setState(() {
                      item.addToCart = !item.addToCart;
                    });
                  },
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}

class BuildWeeklyCard extends StatelessWidget {
  final WeeklyoffersModel item;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onAddToCartToggle;

  const BuildWeeklyCard({
    Key? key,
    required this.item,
    required this.onFavoriteToggle,
    required this.onAddToCartToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      onPressed: onFavoriteToggle,
                      icon: Icon(Icons.favorite,
                          color: item.favorite
                              ? Colors.grey[200]
                              : Color.fromARGB(255, 15, 206, 171)),
                    ),
                  ],
                ),
                Expanded(
                  child: Image.network(item.image),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(item.volume),
                ),
                Container(
                  color: Colors.grey[400],
                  width: 150,
                  height: 50,
                  child: TextButton(
                    onPressed: onAddToCartToggle,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        item.addToCart
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
                      style: TextStyle(color: Colors.white),
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
                  item.name,
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
                      "${item.localValue.toStringAsFixed(2)} ${item.localCurrency}",
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
                    "${item.convertedValue.toStringAsFixed(2)} ${item.convertedCurrency}",
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

//Purrfectly==================================================================

class Purrfectly extends StatefulWidget {
  const Purrfectly({
    super.key,
  });

  @override
  State<Purrfectly> createState() => _PurrfectlyState();
}

class _PurrfectlyState extends State<Purrfectly> {
  late Future<List<PurrfectlyModel>> _boxedState;

  List<PurrfectlyModel> _currentBoxedState = [];

  @override
  void initState() {
    super.initState();
    _boxedState = loadPurrfectly();
  }

  void toggleFavorite(PurrfectlyModel item) {
    setState(() {
      item.favorite = !item.favorite;
    });
    print(item.favorite ? "Added to favorites" : "Removed from favorites");
  }

  void toggleCart(PurrfectlyModel item) {
    setState(() {
      item.addToCart = !item.addToCart;
    });
    print(item.addToCart ? "Added to cart" : "Removed from cart");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PurrfectlyModel>>(
      future: _boxedState,
      builder: (context, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshots.hasError) {
          return Center(
            child: Text("Error: ${snapshots.error}"),
          );
        } else if (!snapshots.hasData || snapshots.data!.isEmpty) {
          return const Center(
            child: Text("No Purrfectly Essentials"),
          );
        } else {
          _currentBoxedState = snapshots.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _currentBoxedState.map((boxedStateItem) {
                return buildPurrfectly(
                  boxedStateItem,
                  toggleFavorite,
                  toggleCart,
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}

Widget buildPurrfectly(
  PurrfectlyModel purrfectlyStateItem,
  void Function(PurrfectlyModel) onToggleFavorite,
  void Function(PurrfectlyModel) onToggleCart,
) {
  return Column(
    children: [
      Card(
        shape: RoundedRectangleBorder(),
        child: Container(
          width: 150,
          height: 230,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => onToggleFavorite(purrfectlyStateItem),
                    icon: Icon(Icons.favorite,
                        color: purrfectlyStateItem.favorite
                            ? Colors.grey[400]
                            : const Color.fromARGB(255, 15, 206, 171)),
                  ),
                ],
              ),
              Expanded(
                child: Image.network(
                  purrfectlyStateItem.image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  purrfectlyStateItem.volume,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                color: Colors.grey[400],
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () => onToggleCart(purrfectlyStateItem),
                  style: TextButton.styleFrom(
                    backgroundColor: purrfectlyStateItem.addToCart
                        ? Colors.grey[400]
                        : const Color.fromARGB(255, 15, 206, 171),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(
                    purrfectlyStateItem.addToCart
                        ? "REMOVE FROM CART"
                        : "ADD TO CART",
                    style: const TextStyle(
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
                purrfectlyStateItem.name,
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
                    "${purrfectlyStateItem.khmerValue}",
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
                  "${purrfectlyStateItem.value}",
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
