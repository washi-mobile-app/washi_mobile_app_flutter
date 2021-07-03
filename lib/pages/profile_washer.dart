import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:washi_flutter_app/pages/edit_profile.dart';
import 'package:washi_flutter_app/entities/Profile.dart';
import 'package:washi_flutter_app/util/user_helper.dart';
import 'washer_navbar.dart';

class ProfileWasher extends StatefulWidget {
  @override
  _ProfileWasherState createState() => _ProfileWasherState();
}

class _ProfileWasherState extends State<ProfileWasher> {
  String url = "http://washi-api.azurewebsites.net/api";
  List userData = [];
  List emailData = [];
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

  Future<String> usersData() async {
    var response = await http.get(
      Uri.parse(url + "/users/"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      emailData = extractData;
    });

    return "success";
  }

  @override
  void initState() {
    this.clientData();
    this.usersData();
  }

  final Profiles profile = Profiles(
      name: "John Doe",
      email: "johndoe@gmail.com",
      number: "987 654 321",
      address: "Av. Brasil 123");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: WasherNavBar(),
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
                    title: Text("Email"),
                    subtitle: Text(emailData[userId]['email'].toString()),
                    leading: Icon(Icons.email),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Phone number"),
                    subtitle: Text(userData[userId]['phoneNumber'].toString()),
                    leading: Icon(Icons.phone),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Address"),
                    subtitle: Text(userData[userId]['address'].toString()),
                    leading: Icon(Icons.location_on),
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
