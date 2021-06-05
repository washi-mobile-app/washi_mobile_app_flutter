import 'package:flutter/material.dart';
import 'package:washi_flutter_app/entities/Laundry.dart';
import 'package:washi_flutter_app/pages/orders.dart';

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

  _LaundryDetailScreen(this.laundry);
  String service = 'Lavado al agua';
  String material = 'lana';
  String detergent = 'ariel';
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
                  child: Image.network(
                    laundry.imageLogo,
                    width: 150,
                    height: 150,
                  ),
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
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: DropdownButton<String>(
                          value: service,
                          icon: const Icon(Icons.arrow_downward_sharp),
                          iconSize: 24,
                          elevation: 16,
                          items: <String>[
                            'Lavado al agua',
                            'Lavado al seco',
                            'Lavado a mano',
                            'planchado'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              service = newValue!;
                            });
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: DropdownButton<String>(
                          value: material,
                          icon: const Icon(Icons.arrow_downward_sharp),
                          iconSize: 24,
                          elevation: 16,
                          items: <String>['lana', 'algodon', 'lino']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(16),
                        child: DropdownButton<String>(
                          value: detergent,
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
                          onChanged: (String? newValue) {},
                        ))),
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
                              builder: (BuildContext context) => Orders()));
                    })
              ],
            )
          ],
        ));
  }
}
