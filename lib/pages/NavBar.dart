import 'package:flutter/material.dart';
import 'package:washi_flutter_app/pages/laundries.dart';
import 'package:washi_flutter_app/pages/laundry_orders.dart';
import 'package:washi_flutter_app/pages/orders.dart';
import 'package:washi_flutter_app/pages/promotions_list.dart';
import 'package:washi_flutter_app/pages/washer_notifications.dart';

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
                  builder: (BuildContext context) => Laundries()));
        },
      ),
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
        title: Text('Notificationes'),
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WasherNotifications()));
        },
      ),
      ListTile(
        leading: Icon(Icons.bookmark),
        title: Text('Mis órdenes'),
        onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Orders()));
        },
      ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('Laundry - Órdenes'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LaundryOrders()));
            },
          ),
      ListTile(
        leading: Icon(Icons.location_on),
        title: Text('Mis direcciones'),
      ),
      ListTile(
        leading: Icon(Icons.help_outline_rounded),
        title: Text('Ayuda'),
      )
    ]));
  }
}
