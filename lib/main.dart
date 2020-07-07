import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/home_screen.dart';
import 'package:flutterapp/Screens/payscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialRoute: '/',
      routes: {
          '/':(context) => HomeScreen(),

          PaymentScreen.routeName: (context) => PaymentScreen(),
      },
    );
  }
}
