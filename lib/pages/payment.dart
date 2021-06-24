import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:washi_flutter_app/entities/Payment.dart';

import 'washer_navbar.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String url = "http://washi-api.azurewebsites.net/api";
  List paymentData = [];
  int paymentId = 1;

  Future<String> paymentsData() async {
    var response = await http.get(
      Uri.parse(url + "/paymentmethods/"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI3IiwiZW1haWwiOiJzdHJpbmciLCJyb2xlIjoiV2FzaGVyIiwibmJmIjoxNjI0MDQ3NTcxLCJleHAiOjE2MjQ2NTIzNzEsImlhdCI6MTYyNDA0NzU3MX0.Bc71N-TzMeuDvLmOKWieTLikqTpMRT23bijWz7cQtkA'
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      paymentData = extractData;
    });

    return "success";
  }

  @override
  void initState() {
    this.paymentsData();
  }

  List<bool> _selections = List.generate(2, (_) => false);
  final List<Payments> payments = <Payments>[
    Payments(
      brand: "Visa",
      number: "4213 1234 4321 3421",
      date: "06/21",
    ),
    Payments(
      brand: "Visa",
      number: "9876 8976 6789 7689",
      date: "06/21",
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: WasherNavBar(),
      appBar: AppBar(
        title: Text("Métodos de pago"),
      ),
      body: Container(
        child: new ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) =>
                buildCard(context, index)),
      ),
    );
  }

  Widget buildCard(BuildContext context, int index) {
    final payment = payments[index];
    final number = payment.number.substring(payment.number.length - 4);
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 6.0, bottom: 4.0),
                child: Row(children: <Widget>[
                  Text(paymentData[paymentId]['name'].toString(),
                      style: new TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
                child: Row(
                  children: <Widget>[
                    Text(number),
                    Spacer(),
                    ToggleButtons(
                        children: <Widget>[
                          Icon(Icons.check_circle),
                          Icon(Icons.check_circle_outline)
                        ],
                        onPressed: (int index) {
                          setState(() {
                            for (int buttonIndex = 0;
                                buttonIndex < _selections.length;
                                buttonIndex++) {
                              if (buttonIndex == index) {
                                _selections[buttonIndex] =
                                    !_selections[buttonIndex];
                              } else {
                                _selections[buttonIndex] = false;
                              }
                            }
                          });
                        },
                        isSelected: _selections),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
                child: Row(children: <Widget>[
                  Text(payment.date),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
