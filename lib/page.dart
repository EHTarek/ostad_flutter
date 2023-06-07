

import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  final Color color;
  final int number;

  MyPage({required this.color, required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: color,
        child: Icon(Icons.arrow_circle_up_sharp),
      ),
      body: Center(
        child: Text(
          'Page $number',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

