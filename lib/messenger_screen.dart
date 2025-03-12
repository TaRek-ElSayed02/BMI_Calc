import 'package:flutter/material.dart';
import 'package:flutter_first_task/products_model.dart';
import 'chats.dart';
import 'user_avatar.dart';
import 'api_provider.dart';

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({super.key});

  @override
  MessengerScreenState createState() => MessengerScreenState();
}

class MessengerScreenState extends State<MessengerScreen> {
  final ApiProvider _apiProvider = ApiProvider();
  late Future<ProductsModel?> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = _apiProvider.getProducts();
  }

  String truncateName(String name, int maxLength) {
    return name.length > maxLength
        ? '${name.substring(0, maxLength)}...'
        : name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chats",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.camera_alt, color: Colors.white),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 10),
          Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 10),
        ],
        elevation: 0,
      ),
      body: FutureBuilder<ProductsModel?>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data == null) {
            return const Center(child: Text("Failed to load products"));
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 5),
                          Text("Search"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemCount: snapshot.data!.products.length,
                        itemBuilder:
                            (context, index) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  UserAvatar(
                                    name:
                                        snapshot.data!.products[index].title
                                            .trim(),
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Chats(products: snapshot.data!.products),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
