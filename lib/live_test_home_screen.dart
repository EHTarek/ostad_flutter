import 'package:flutter/material.dart';

class LiveTestHomeScreen extends StatelessWidget {
  const LiveTestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Live Test',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.message),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Live Test'),
              accountEmail: Text('Md. Tariqul Islam'),
              decoration: BoxDecoration(color: Colors.deepPurpleAccent),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            Divider(color: Colors.deepPurpleAccent),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
            Divider(color: Colors.deepPurpleAccent),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            fit: BoxFit.cover,
          ),
          Text('Live Test App Body')
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () {},
          child: Icon(
            Icons.arrow_circle_right_outlined,
            size: 36,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
