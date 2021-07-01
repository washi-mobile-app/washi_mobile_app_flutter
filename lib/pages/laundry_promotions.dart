import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI3IiwiZW1haWwiOiJzdHJpbmciLCJyb2xlIjoiV2FzaGVyIiwibmJmIjoxNjI1MTA3MjUzLCJleHAiOjE2MjU3MTIwNTMsImlhdCI6MTYyNTEwNzI1M30.cWb7j1WKhecCXMs68ubkebAz09-WvX2rSZwGi5caABQ'
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      promotions = extractData;
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
