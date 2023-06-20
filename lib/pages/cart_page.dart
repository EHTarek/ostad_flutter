import 'package:flutter/material.dart';
import '../model/product_model.dart';

class CartPage extends StatelessWidget {
  List<Product> products;

  CartPage(this.products);

  @override
  Widget build(BuildContext context) {
    int totalQuantity = 0;
    for (var product in products) {
      totalQuantity += product.quantity;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text(
          'Total Products: $totalQuantity',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
