import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  int value;
  SecondScreen({required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Text(
          "Congratulations! You reached $value!",
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
