import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:washi_flutter_app/entities/Payment.dart';

import 'NavBar.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Métodos de pago"),
    ),
      body: Container(
        child: new ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) => buildCard(context, index)
        ),

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
                child: Row(
                  children: <Widget> [
                    Text(payment.brand, style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                  ]
                ),
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
                            for(int buttonIndex = 0; buttonIndex < _selections.length; buttonIndex++) {
                              if(buttonIndex == index) {
                                _selections[buttonIndex] = !_selections[buttonIndex];
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
                child: Row(
                  children: <Widget>[
                    Text(payment.date),
                  ]
                ),
              ),
            ],

          ),

        ),
      ),
    );
  }
}
