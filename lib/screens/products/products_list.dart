import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/models/product_model.dart';
import 'package:flutter_application_2/screens/home/home.dart';
import 'package:flutter_application_2/screens/products/add_new_product.dart';
import 'package:flutter_application_2/screens/products/products_list_items.dart';
import 'package:flutter_application_2/services/database.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<ProductModel>?>.value(
      value: DatabaseService(uid: '').products, 
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('المنتجات'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          leading: TextButton.icon(
            onPressed: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            icon: Icon(
              Icons.home,
              color: Colors.brown[100],
            ),
            label: Text(''),
            // label: Padding(
            //   padding: const EdgeInsets.all(3.0),
            //   child: Text(
            //     'الرئيسية',
            //     style: TextStyle(
            //       color: Colors.brown[100],
            //     ),
            //   ),
            // ),
          ),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async {
                // await _auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AddNewProduct()),
                );
              },
              icon: Icon(
                Icons.add,
                color: Colors.brown[100],
              ),
              label: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  'منتج جديد',
                  style: TextStyle(
                    color: Colors.brown[100],
                  ),
                ),
              ),
            ),
          ],
        ),
        body: PRListItems(),
      ),
    );
  }
}
