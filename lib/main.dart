// Eng Mouaz M. Al-Shahmeh
 
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localeListResolutionCallback: (locales, supportedLocales) {
        return Locale('ar', 'SA');
      },
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: [
        //AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: 'Flutter App 2',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Wrapper(),
    );
  }
}
