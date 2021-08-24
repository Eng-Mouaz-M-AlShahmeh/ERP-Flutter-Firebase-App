// Eng Mouaz M. Al-Shahmeh
 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_2/screens/home/home.dart';
import 'package:flutter_application_2/screens/products/products_list.dart';
import 'package:flutter_application_2/screens/widgets/input_textfield_decoration.dart';
import 'package:flutter_application_2/services/database.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({Key? key}) : super(key: key);

  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  @override
  Widget build(BuildContext context) {
    final _formAddNewProdKey = GlobalKey<FormState>();
    final DatabaseService _products = DatabaseService(uid: '');

    // textfield state
    String title = '';
    double? price = 0.0;
    int? quantity = 0;
    Timestamp timeAdded = Timestamp(0, 0);
    String error = '';

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('اضافة منتج جديد'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              // await _auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProductsList()),
              );
            },
            icon: Icon(
              Icons.cancel,
              color: Colors.brown[100],
            ),
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'الغاء',
                style: TextStyle(
                  color: Colors.brown[100],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.5,
          ),
          child: Form(
            key: _formAddNewProdKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration('اسم المنتج'),
                  validator: (val) => val!.isEmpty ? 'ادخل اسم المنتج' : null,
                  // textDirection: TextDirection.ltr,
                  onSaved: (val) {
                    setState(() => title = val!);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration('السعر'),
                  validator: (val) { 
                    if(val!.isEmpty) {
                      return 'ادخل سعر المنتج' ;
                    } else if(!(double.tryParse(val) != null)) {
                      return 'الرجاء ادخال رقم';
                    }
                  },
                  // textDirection: TextDirection.ltr,
                  onSaved: (val) {
                    setState(() => price = double.tryParse(val!));
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration('الكمية'),
                  validator: (val) { 
                    if(val!.isEmpty) {
                      return 'ادخل كمية المنتج' ;
                    } else if(!(int.tryParse(val) != null)) {
                      return 'الرجاء ادخال رقم';
                    }
                  },
                  // textDirection: TextDirection.ltr,
                  onSaved: (val) {
                    setState(() => quantity = int.tryParse(val!));
                  },
                ),
                SizedBox(height: 20.0),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.pink[400],
                    ),
                  ),
                  onPressed: () async {
                    if (_formAddNewProdKey.currentState!.validate()) {
                      _formAddNewProdKey.currentState!.save();
                      DateTime _now = DateTime.now();
                      setState(
                        () => timeAdded = Timestamp.fromDate(_now),
                      );
                      dynamic result = await _products.updateProductData(
                          title, price, quantity, timeAdded);
                      // if (result == null) {
                      //   print('error');
                      //   setState(() => error = 'هناك خطآ راجع الادارة');
                      // } else {
                        print(result);
                        await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductsList()),
                        );
                      // }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'اضافة منتج جديد',
                      style: TextStyle(color: Colors.brown[100]),
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
