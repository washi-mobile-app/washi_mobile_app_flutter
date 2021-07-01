import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:washi_flutter_app/entities/Laundry.dart';
import 'package:washi_flutter_app/entities/Service.dart';
import 'package:washi_flutter_app/entities/materials.dart';
import 'package:washi_flutter_app/pages/offers.dart';
import 'package:washi_flutter_app/pages/order1.dart';
import 'package:washi_flutter_app/pages/orders.dart';
import 'package:washi_flutter_app/util/user_helper.dart';

class LaundryDetailScreen extends StatelessWidget {
  final Laundry laundry;
  const LaundryDetailScreen({Key? key, required this.laundry})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyStatefulWidget(laundry: laundry),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final Laundry laundry;
  const MyStatefulWidget({Key? key, required this.laundry}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _LaundryDetailScreen(laundry);
}

class _LaundryDetailScreen extends State<MyStatefulWidget> {
  final Laundry laundry;
  String url = "http://washi-api.azurewebsites.net/api";
  static List<Service> service = [];
  static List<Materials> material = [];
  List detergent = [];

  Future<String> serviceData() async {
    var response = await http.get(
      Uri.parse(url + "/materials"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      service = extractData;
    });

    return response.body.toString();
  }

  Future<String> materialData() async {
    var response = await http.get(
      Uri.parse(url + "/materials"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      material = extractData;
    });

    return response.body.toString();
  }

  @override
  initState() {
    this.serviceData();
    this.materialData();
    super.initState();
  }

  _LaundryDetailScreen(this.laundry);
  Service serviceState = service[0];
  Materials materialState = material[0];
  String detergentState = 'ariel';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(laundry.name)),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(16),
                  child: FlutterLogo(size: 56.0),
                )),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                            '${laundry.district} \n \n ${laundry.phone} \n \n ${laundry.email}')))
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    flex: 45,
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: DropdownButton<Service>(
                          value: serviceState,
                          icon: const Icon(Icons.arrow_downward_sharp),
                          iconSize: 24,
                          elevation: 16,
                          items: service
                              .map<DropdownMenuItem<Service>>((Service value) {
                            return DropdownMenuItem<Service>(
                              value: value,
                              child: Text(value.name),
                            );
                          }).toList(),
                          onChanged: (Service? newValue) {
                            setState(() {
                              serviceState = newValue!;
                            });
                          },
                        ))),
                Expanded(
                    flex: 30,
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: DropdownButton<Materials>(
                          value: materialState,
                          icon: const Icon(Icons.arrow_downward_sharp),
                          iconSize: 24,
                          elevation: 16,
                          items: material.map<DropdownMenuItem<Materials>>(
                              (Materials value) {
                            return DropdownMenuItem<Materials>(
                              value: value,
                              child: Text(value.name),
                            );
                          }).toList(),
                          onChanged: (Materials? newValue) {
                            setState(() {
                              materialState = newValue!;
                            });
                          },
                        ))),
                Expanded(
                    flex: 25,
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: DropdownButton<String>(
                            value: detergentState,
                            icon: const Icon(Icons.arrow_downward_sharp),
                            iconSize: 24,
                            elevation: 16,
                            items: <String>['ariel', 'ace', 'skip']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                detergentState = newValue!;
                              });
                            }))),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Tipo de servicio:  $service \n \n Kilogramos: 1 \n \n Precio: s/.12.00',
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        '$service:  s/. 12.00 \n \n Delivery: s/. 5.00 \n \n ',
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 60)),
                MaterialButton(
                    height: 60,
                    minWidth: 90,
                    color: Colors.white,
                    textColor: Color.fromRGBO(121, 47, 218, 1),
                    child: Text(
                      'Solicitar servicio',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Orders1()));
                    }),
                MaterialButton(
                    height: 60,
                    minWidth: 90,
                    color: Colors.white,
                    textColor: Color.fromRGBO(121, 47, 218, 1),
                    child: Text(
                      'Ver ofertas',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Offers()));
                    })
              ],
            )
          ],
        ));
  }
}
