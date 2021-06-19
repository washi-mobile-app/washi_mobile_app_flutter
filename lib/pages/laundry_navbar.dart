import 'package:flutter/material.dart';
import 'package:washi_flutter_app/pages/laundries.dart';
import 'package:washi_flutter_app/pages/laundry_orders.dart';
import 'package:washi_flutter_app/pages/orders.dart';
import 'package:washi_flutter_app/pages/profile_laundry.dart';
import 'package:washi_flutter_app/pages/promotions_list.dart';
import 'package:washi_flutter_app/pages/washer_notifications.dart';

import '../main.dart';
import 'laundry_notifications.dart';

class LaundryNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      UserAccountsDrawerHeader(
          accountName: Text('Hola,'),
          accountEmail: Text('Laundry'),
          currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image(
            image: AssetImage("lib/assets/logo.png"),
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
                  builder: (BuildContext context) => LaundryOrders()));
        },
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text('Profile'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProfileLaundry()));
        },
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.notifications),
        title: Text('Notificationes'),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LaundryNotifications()));
        },
      ),
      ListTile(
        leading: Icon(Icons.bookmark),
        title: Text('Mis órdenes'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => LaundryOrders()));
        },
      ),
      ListTile(
        leading: Icon(Icons.favorite),
        title: Text('Promociones'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Promotions()));
        },
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.help_outline_rounded),
        title: Text('Ayuda'),
      ),
      ListTile(
          leading: Icon(Icons.subdirectory_arrow_left),
          title: Text('Cerrar sesión'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) => Index()));
          })
    ]));
  }
}
