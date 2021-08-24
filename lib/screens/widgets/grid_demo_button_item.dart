// Eng Mouaz M. Al-Shahmeh
 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/button_model.dart';
import 'package:flutter_application_2/screens/products/products_list.dart';
import 'package:flutter_application_2/screens/widgets/grid_title_text.dart';

class GridDemoButtonItem extends StatelessWidget {
  const GridDemoButtonItem({
    Key? key,
    required this.button,
  }) : super(key: key);

  final ButtonModel button;

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.black26,
        ),
      ),
      // Image.asset(
      //   button.assetName,
      //   fit: BoxFit.cover,
      // ),
    );

    if (button.title == 'المنتجات') {
      return GridTile(
        footer: Material(
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
          ),
          clipBehavior: Clip.antiAlias,
          child: GridTileBar(
            backgroundColor: Colors.black45,
            title: GridTitleText(
              text: button.title,
            ),
            // subtitle: GridTitleText(text: button.subtitle),
          ),
        ),
        child: InkWell(
            child: image,
            onTap: () async {
              QuerySnapshot querySnapshot =
                  await FirebaseFirestore.instance.collection("products").get();

              // print(querySnapshot.docs.map((doc) => doc.data()).toList());

              await Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProductsList()),
              );
            }),
      );
    } else {
      return
          //image;

          GridTile(
        footer: Material(
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
          ),
          clipBehavior: Clip.antiAlias,
          child: GridTileBar(
            backgroundColor: Colors.black45,
            title: GridTitleText(
              text: button.title,
            ),
            //subtitle: GridTitleText(text: button.subtitle),
          ),
        ),
        child: image,
      );
    }
  }
}
