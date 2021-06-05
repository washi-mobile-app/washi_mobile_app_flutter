import 'package:flutter/material.dart';
import 'package:washi_mobile_app_flutter/pages/orders.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Washi App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Orders(),
    );
  }
}

