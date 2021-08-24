import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product_model.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[100],
          ),
          title: Text(product.title ?? ''),
          subtitle: Text('السعر: ${product.price} ريال - الكمية: ${product.quantity}'),
        ),
      ),
    );
  }
}
