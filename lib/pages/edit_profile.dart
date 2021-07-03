import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:washi_flutter_app/pages/profile_washer.dart';
import 'package:washi_flutter_app/entities/Profile.dart';
import 'package:washi_flutter_app/pages/profile_washer.dart';
import 'package:washi_flutter_app/util/user_helper.dart';

class EditProfile extends StatefulWidget {
  final Profiles profiles = Profiles(
      name: "John Doe",
      email: "johndoe@gmail.com",
      number: "987654321",
      address: "Av. Brasil 123");
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String url = "http://washi-api.azurewebsites.net/api";
  List userData = [];
  int userId = 1;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Container(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("lib/assets/laundry.jpg"),
                              ))),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 4, color: Colors.white),
                                color: Colors.lightBlueAccent),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 30),
                buildTextField("Name", userData[userId]['firstName'].toString() +
                    " " +
                    userData[userId]['lastName'].toString()),
                buildTextField("Email", userData[userId]['corporationName'].toString()),
                buildTextField("Phone Number", userData[userId]['phoneNumber'].toString()),
                buildTextField("Address", userData[userId]['address'].toString()),
                SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ProfileWasher()));
                        },
                        child: Text("Cancel",
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2,
                              color: Colors.black,
                            )),
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ProfileWasher()));
                        },
                        child: Text("Save",
                            style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 2,
                                color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                      )
                    ])
              ]))),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
        padding: EdgeInsets.only(bottom: 30, left: 10, right: 10),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            hintText: placeholder,
          ),
        ));
  }
}
