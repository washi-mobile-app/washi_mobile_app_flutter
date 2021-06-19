import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:washi_flutter_app/pages/edit_profile.dart';
import 'package:washi_flutter_app/entities/Profile.dart';
import 'NavBar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Profiles profile = Profiles(
    name: "John Doe",
    email: "johndoe@gmail.com",
    number: "987 654 321",
    address: "Av. Brasil 123"
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
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
              )
          ),
          Card(
            child: Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Name"),
                    subtitle: Text(profile.name),
                    leading: Icon(Icons.person),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Email"),
                    subtitle: Text(profile.email),
                    leading: Icon(Icons.email),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Phone number"),
                    subtitle: Text(profile.number),
                    leading: Icon(Icons.phone),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Address"),
                    subtitle: Text(profile.address),
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
                child: Text("Update Info", style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 2,
                  color: Colors.white
                )),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
            ),
          )
        ],
      ),
    );
  }
}

