import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items =[
    'Apples',
    'Bananas',
    'Bread',
    'Milk',
    'Eggs',
    'Guava',
    'Mango',
    'Strawberry',
    'Jack-fruit',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Shopping List'),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cart is empty')));
            });
          }, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index)=>ListTile(
          leading: Icon(Icons.shopping_basket),
          title: Text(items[index]),
          onTap: (){},
        ),
      ),
    );
  }
}