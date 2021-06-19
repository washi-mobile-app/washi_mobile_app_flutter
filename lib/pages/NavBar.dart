import 'package:flutter/material.dart';
import 'package:washi_flutter_app/pages/laundries.dart';
import 'package:washi_flutter_app/pages/orders.dart';
import 'package:washi_flutter_app/pages/payment.dart';
import 'package:washi_flutter_app/pages/promotions_list.dart';
import 'package:washi_flutter_app/pages/profile_washer.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      UserAccountsDrawerHeader(
          accountName: Text('Hola,'),
          accountEmail: Text('Washer'),
          currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image(
            image: AssetImage("lib/assets/laundry.jpg"),
            fit: BoxFit.cover,
            width: 90,
            height: 90,
          )))),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('Home'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Laundries()));
        },
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text('Profile'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Profile()));
        },
      ),
      Divider(),
      ListTile(
          leading: Icon(Icons.favorite),
          title: Text('Promotions'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Promotions()));
          }),
      ListTile(
        leading: Icon(Icons.notifications),
        title: Text('Notificaciones'),
      ),
      ListTile(
        leading: Icon(Icons.bookmark),
        title: Text('Mis órdenes'),
        onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Orders()));
        }),
      Divider(),
      ListTile(
        leading: Icon(Icons.location_on),
        title: Text('Mis direcciones'),
      ),
      ListTile(
        leading: Icon(Icons.credit_card),
        title: Text('Métodos de pago'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Payment()));
        }),
      Divider(),
      ListTile(
        leading: Icon(Icons.help_outline_rounded),
        title: Text('Ayuda'),
      )
    ]));
  }
}
