import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search for products...',
                    prefixIcon: Icon(Icons.search, color: Colors.blue),
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onChanged: (value) {
                    print('User is searching: $value');
                  },
                ),
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Propular  searches",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 350,
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text("Labned"),
                ),
              ],
            ),
            const SizedBox(
              width: 350,
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text("Coffee"),
                ),
              ],
            ),
            const SizedBox(
              width: 350,
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text("Cheese"),
                ),
              ],
            ),
            const SizedBox(
              width: 350,
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text("Yogurt"),
                ),
              ],
            ),
            const SizedBox(
              width: 350,
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text("Chocolate"),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    child: const Icon(
                      Icons.message_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 10),
                      child: Text(
                        "Can't find what you're \n looking for?",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 51),
                      child: Text('Let us help you'),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Container(
                    width: 160,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 15, 206, 171),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.phone, color: Colors.white),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Contact Us",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
