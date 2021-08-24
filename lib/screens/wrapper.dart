// Eng Mouaz M. Al-Shahmeh
 
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/screens/authenticate/authenticate.dart';
// import 'package:flutter_application_2/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Authenticate();
  }
}

// class Wrapper extends StatefulWidget {
//   const Wrapper({ Key? key }) : super(key: key);
//   @override
//   _WrapperState createState() => _WrapperState();
// }
// class _WrapperState extends State<Wrapper> {
//   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Initialize FlutterFire:
//       future: _initialization,
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           return Authenticate();
//         }
//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Authenticate();
//         }
//         // Otherwise, show something whilst waiting for initialization to complete
//         return Authenticate();
//       },
//     );
//   }
// }
