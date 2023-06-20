import 'package:flutter/material.dart';
import 'package:ostad_task/pages/cart_page.dart';
import 'model/product_model.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<Product> _products = [
    Product('T-shirt', 10.0, 0),
    Product('Jeans', 15.0, 0),
    Product('Sneakers', 20.0, 0),
    Product('Hoodie', 20.0, 0),
    Product('Skirt', 20.0, 0),
    Product('Sandals', 20.0, 0),
    Product('Joggers', 20.0, 0),
    Product('Polo shirt', 20.0, 0),
    Product('Shorts', 20.0, 0),
    Product('Denim jacket', 20.0, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_products[index].name),
            subtitle:
                Text('Price: \$${_products[index].price.toStringAsFixed(2)}'),
            trailing: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Counter: ${_products[index].quantity}'),
                  ElevatedButton(
                    child: const Text('Buy Now'),
                    onPressed: () => _incrementCounter(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => CartPage(_products)));
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }

  void _incrementCounter(int index) {
    _products[index].quantity++;

    if (_products[index].quantity == 5) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Congratulations!',
              style: TextStyle(fontSize: 26),
            ),
            content: Text('You\'ve bought 5 ${_products[index].name}!'),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    setState(() {});
  }
}
