import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String? title;
  final double? price;
  final int? quantity;
  final Timestamp? timeAdded;

  ProductModel({
    this.title,
    this.price,
    this.quantity,
    this.timeAdded,
  });
}
