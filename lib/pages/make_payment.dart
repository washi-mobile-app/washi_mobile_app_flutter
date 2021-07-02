import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:washi_flutter_app/pages/order1.dart';

class PaymentAction extends StatefulWidget {
  @override
  _PaymentActionState createState() => _PaymentActionState();
}

class _PaymentActionState extends State<PaymentAction> {
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facturación'),
      ),
      body: Form(
        child: Container(
          width: 500,
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 15)),
              Text(
                "Información de la tarjeta",
                style: TextStyle(fontSize: 18),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 15)),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Número de tarjeta de crédito o débito',
                  hintText: '5555 5555 5555 5555',
                ),
                keyboardType: TextInputType.number,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 15)),
              Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 15)),
                    new Flexible(
                        child: new TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Fecha de expiración',
                            hintText: '01/21',
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(5, 20, 0, 15)),
                    new Flexible(
                      child: new TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'CVV',
                          hintText: '123',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 15)),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre de la tarjeta',
                  hintText: 'John Doe',
                ),
                keyboardType: TextInputType.number,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 15)),
              MaterialButton(
                  height: 60,
                  color: Colors.white,
                  textColor: Color.fromRGBO(121, 47, 218, 1),
                  child: Text(
                    'Pagar',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Orders()));
                  }
              )
            ],
          ),

        ),
      ),
    );
  }
}

