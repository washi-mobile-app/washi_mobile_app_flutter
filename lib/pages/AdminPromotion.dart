import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:washi_flutter_app/pages/laundry_promotions.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

import 'package:washi_flutter_app/util/user_helper.dart';

class AdminPromotion extends StatefulWidget {
  @override
  _AdminPromotionState createState() => _AdminPromotionState();
}

class _AdminPromotionState extends State<AdminPromotion> {
  String url = "http://washi-api.azurewebsites.net/api";
  List promotions = [];

  String dropdownValue = 'Calzado';
  String secondownValue = '10';

  Future<String> postPromotion(int percentage) async {
    var random = new Random();
    int materialId= random.nextInt(5);

    final response = await http.post(
          Uri.parse(url + "/promotions/"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
      body: jsonEncode({
        "laundryServiceMaterialId": materialId,
        "discountPercentage": percentage,
        "initialDate": "2021-07-01T02:36:59.740Z",
        "endingDate": "2021-07-01T02:36:59.740Z"
      }),
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      promotions = extractData;
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return "success";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update promotion.' +
          percentage.toString() +
          "//" +
          materialId.toString());
    }
  }

  @override
  initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Promotion"),
      ),
      body: Form(
        child: Container(
          padding: EdgeInsets.all(35),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration:
                    InputDecoration(labelText: "Nombre de la promoción"),
                keyboardType: TextInputType.text,
              ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Categoria',
                  ),
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Calzado', 'Frazada', 'Lavado', 'Secado']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Descuento',
                  ),
                  value: secondownValue,
                  icon: Icon(Icons.arrow_downward),
                  onChanged: (String? newValue) {
                    setState(() {
                      secondownValue = newValue!;
                    });
                  },
                  items: <String>['10', '15', '20', '25']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: new FloatingActionButton(
        child: Text("Add"),
        onPressed: () {
          postPromotion(int.parse(secondownValue));
          Navigator.pop(context,
              MaterialPageRoute(builder: (BuildContext) => Promotions()));
        },
      ),
    );
  }
}
