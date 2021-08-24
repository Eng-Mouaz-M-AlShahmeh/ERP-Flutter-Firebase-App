// Eng Mouaz M. Al-Shahmeh
 
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/buttons_list.dart';
import 'package:flutter_application_2/screens/authenticate/authenticate.dart';
import 'package:flutter_application_2/screens/widgets/grid_demo_button_item.dart';
import 'package:flutter_application_2/services/auth.dart';
// import 'package:flutter_application_2/services/database.dart';
// import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('الرئيسية'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Authenticate()),
              );
            },
            icon: Icon(
              Icons.person,
              color: Colors.brown[100],
            ),
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'تسجيل الخروج',
                style: TextStyle(
                  color: Colors.brown[100],
                ),
              ),
            ),
          ),
        ],
      ),
      body: GridView.count(
        restorationId: 'grid_view_demo_grid_offset',
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        childAspectRatio: 1,
        children: buttons(context).map<Widget>((button) {
          return TextButton(
            onPressed: () {},
            child: GridDemoButtonItem(
              button: button,
            ),
          );
        }).toList(),
      ),
    );
  }
}
