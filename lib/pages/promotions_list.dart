import 'package:flutter/material.dart';
import 'package:washi_flutter_app/pages/NavBar.dart';

import 'AdminPromotion.dart';


class Promotions extends StatefulWidget {
  @override
  _PromotionsState createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promociones"),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, i){
          return ListTile(
            title: Text("Promoción lavado"),
            subtitle: Text("Descuento 10%"),
            leading: CircleAvatar(
              backgroundImage: AssetImage("lib/assets/logo.png"),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: new FloatingActionButton(
        child: Text("New"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => AdminPromotion()));
        },
      ),
    );
  }
}