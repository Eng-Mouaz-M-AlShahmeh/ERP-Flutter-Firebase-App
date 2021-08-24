import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product_model.dart';
import 'package:flutter_application_2/screens/products/product_tile.dart';
import 'package:flutter_application_2/screens/widgets/loading.dart';
import 'package:provider/provider.dart';

class PRListItems extends StatefulWidget {
  const PRListItems({Key? key}) : super(key: key);

  @override
  _PRListItemsState createState() => _PRListItemsState();
}

class _PRListItemsState extends State<PRListItems> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<ProductModel>?>(context);

    // if (products != null) {
    //   products.forEach((product) {
    //     print(product.title);
    //     print(product.price);
    //     print(product.quantity);
    //     print(product.timeAdded);
    //   });
    // }

    return products == null ? Loading() : ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductTile(product: products[index]);
      },
    );
  }
}
