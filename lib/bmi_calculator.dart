import 'package:flutter/material.dart';

import 'bmi_result.dart';

void main() {
  runApp(const BMICalculatorScreen());
}

class BMICalculatorScreen extends StatelessWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF1D1E33),
        scaffoldBackgroundColor: const Color(0xFF1D1E33),
      ),
      home: const BMIPage(),
    );
  }
}

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  bool isMale = true;
  int height = 170;
  int weight = 60;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('BMI Calculator'))),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                genderCard(
                  'Male',
                  Icons.male,
                  isMale,
                  () => setState(() => isMale = true),
                ),
                genderCard(
                  'Female',
                  Icons.female,
                  !isMale,
                  () => setState(() => isMale = false),
                ),
              ],
            ),
          ),
          Expanded(
            child: card(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Height',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    '$height cm',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 220,
                    activeColor: Colors.pink,
                    onChanged:
                        (value) => setState(() => height = value.toInt()),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                valueCard(
                  'Weight',
                  weight,
                  () => setState(() => weight--),
                  () => setState(() => weight++),
                ),
                valueCard(
                  'Age',
                  age,
                  () => setState(() => age--),
                  () => setState(() => age++),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              double bmi = weight / ((height / 100) * (height / 100));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          BMIResultScreen(isMale: isMale, age: age, bmi: bmi),
                ),
              );
            },

            child: Container(
              width: double.infinity,
              height: 80,
              color: Colors.pink,
              child: const Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget genderCard(
    String label,
    IconData icon,
    bool selected,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: card(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 80,
                color: selected ? Colors.pink : Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget valueCard(
    String label,
    int value,
    VoidCallback onMinus,
    VoidCallback onPlus,
  ) {
    return Expanded(
      child: card(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              '$value',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                roundButton(Icons.remove, onMinus),
                const SizedBox(width: 10),
                roundButton(Icons.add, onPlus),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget roundButton(IconData icon, VoidCallback onPressed) {
    return FloatingActionButton(
      backgroundColor: Colors.grey[700],
      child: Icon(icon, color: Colors.white),
      onPressed: onPressed,
      mini: true,
    );
  }

  Widget card(Widget child) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF111328),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
