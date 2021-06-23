import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:washi_flutter_app/pages/laundry_orders.dart';
import 'package:washi_flutter_app/util/user_helper.dart';

class LogInLaundry extends StatefulWidget {
  @override
  _LogInLaundryState createState() => _LogInLaundryState();
}

class _LogInLaundryState extends State<LogInLaundry> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String url = "http://washi-api.azurewebsites.net/api";

  Future<String> loginRequest(String email, String password) async {
    final response = await http.post(
      Uri.parse(url + "/users/authenticate"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({"email": email, "password": password}),
    );

    setState(() {
      var extractData = json.decode(response.body);
      UserHelper.token = extractData["token"];
      UserHelper.userid = extractData["id"];
    });

    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LaundryOrders()));
      return "success";
    } else {
      throw Exception('Bad credentials');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laundry'),
        backgroundColor: Color.fromRGBO(121, 47, 218, 1),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 50, right: 40, top: 0),
          children: <Widget>[
            Form(
                child: Container(
                    width: 350,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Padding(padding: EdgeInsets.only(top: 50)),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(121, 47, 218, 1),
                                ),
                              )),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Padding(padding: EdgeInsets.only(top: 50)),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                              labelText: 'Contraseña',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(121, 47, 218, 1),
                                ),
                              )),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Padding(padding: EdgeInsets.only(top: 80)),
                        MaterialButton(
                          height: 50,
                          minWidth: 90,
                          color: Color.fromRGBO(121, 47, 218, 1),
                          textColor: Colors.white,
                          child: Text(
                            'Iniciar Sesión',
                            style: TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            loginRequest(
                                emailController.text, passwordController.text);
                          },
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
