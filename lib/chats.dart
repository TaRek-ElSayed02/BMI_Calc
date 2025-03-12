import 'package:flutter/material.dart';
import 'products_model.dart';

class Chats extends StatelessWidget {
  final List<Product> products;

  const Chats({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(products[index].thumbnail),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2, right: 1),
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            products[index].title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            products[index].description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            "Price: ${products[index].price.toStringAsFixed(0)}",
            style: const TextStyle(fontSize: 14),
          ),
        );
      },
    );
  }
}
