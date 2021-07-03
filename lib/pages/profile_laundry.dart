import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:washi_flutter_app/pages/edit_profile.dart';
import 'package:washi_flutter_app/entities/Profile.dart';
import 'package:washi_flutter_app/pages/laundry_navbar.dart';
import 'package:washi_flutter_app/util/user_helper.dart';
import 'washer_navbar.dart';

class ProfileLaundry extends StatefulWidget {
  @override
  _ProfileLaundryState createState() => _ProfileLaundryState();
}

class _ProfileLaundryState extends State<ProfileLaundry> {
  String url = "http://washi-api.azurewebsites.net/api";
  List userData = [];
  int userId = 5;

  Future<String> clientData() async {
    var response = await http.get(
      Uri.parse(url + "/userprofiles/"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      userData = extractData;
    });

    return "success";
  }

  @override
  void initState() {
    this.clientData();
  }

  final Profiles profile = Profiles(
      name: "Don Lavadon",
      email: "donlavadonperu@gmail.com",
      number: "993 758 780",
      address: "Magdalena");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LaundryNavBar(),
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              child: Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                    radius: 69,
                    child: ClipOval(
                        child: Image(
                      image: AssetImage("lib/assets/laundry.jpg"),
                      fit: BoxFit.cover,
                      width: 140,
                      height: 140,
                    )))
              ],
            ),
          )),
          Card(
            child: Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Name"),
                    subtitle: Text(userData[userId]['firstName'].toString() +
                        " " +
                        userData[userId]['lastName'].toString()),
                    leading: Icon(Icons.person),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Corporation Name"),
                    subtitle: Text(userData[userId]['corporationName'].toString()),
                    leading: Icon(Icons.email),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Número"),
                    subtitle: Text(userData[userId]['phoneNumber'].toString()),
                    leading: Icon(Icons.phone),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Address"),
                    subtitle: Text(userData[userId]['address'].toString()),
                    leading: Icon(Icons.cases),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            constraints: BoxConstraints.tightFor(width: 20, height: 80),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => EditProfile()));
              },
              child: Text("Update Info",
                  style: TextStyle(
                      fontSize: 20, letterSpacing: 2, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
            ),
          )
        ],
      ),
    );
  }
}
