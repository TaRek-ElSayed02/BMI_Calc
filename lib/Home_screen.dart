import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff4544),
        leading: Icon(Icons.menu),
        title: Text("Hello World"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.star_outlined)),
          IconButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            icon: Text("$counter"),
          ),
        ],
      ),
      body: Container(
        color: Colors.teal,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left Red Column (Aligned to Start)
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,

              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 65,
                      height: 60,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 65,
                      height: 60,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            // Right Blue Column (Aligned to End)
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
