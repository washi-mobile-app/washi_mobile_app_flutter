import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:washi_flutter_app/util/user_helper.dart';
import 'AdminPromotion.dart';

class Promotions extends StatefulWidget {
  @override
  _PromotionsState createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions> {
  String url = "http://washi-api.azurewebsites.net/api";
  List promotions = [];

  Future<String> makeRequest() async {
    var response = await http.get(
      Uri.parse(url + "/promotions/"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      promotions = extractData;
    });

    return "success";
  }

  Future<String> delete(int id) async {
    var response = await http.delete(
      Uri.parse(url + "/promotions/" + id.toString()),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
    });

    return "success";
  }

  @override
  initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promociones"),
      ),
      body: ListView.builder(
        itemCount: promotions == Null? 0 : promotions.length,
        itemBuilder: (BuildContext context, i) {
          return ListTile(
            title: Text("Promoción " + promotions[i]['id'].toString()),
            subtitle: Text("Descuento "+ promotions[i]['discountPercentage'].toString() + "%"),
            leading: CircleAvatar(
              backgroundImage: AssetImage("lib/assets/logo.png"),
            ),
            trailing:Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  size: 20.0,
                  color: Colors.brown[900],
                ),
                onPressed: () {
                  delete(promotions[i]['id']);
                },
              ),
            ],
          ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: new FloatingActionButton(
        child: Text("New"),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext) => AdminPromotion()));
        },
      ),
    );
  }
}
