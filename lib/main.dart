import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:washi_mobile_app_flutter/entities/laundry.dart';

import 'laundryDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lista de Lavanderías",
      home: WashiApp(),
    );
  }
}

class WashiApp extends StatefulWidget {
  @override
  WashiAppState createState() => WashiAppState();
}

class WashiAppState extends State<WashiApp> {
  final List<Laundry> laundries = <Laundry>[
    Laundry(
        name: "Lavanderia Akiraki",
        address: "Av. La marina",
        price: 9.99,
        email: "akira@gmail.com",
        district: "San Miguel",
        phone: 958158852,
        imageLogo: "data:image/jpeg;base64,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"),
    Laundry(
        name: "Lavanderia Cledmir",
        address: "Av. faucett",
        price: 10,
        email: "cledmir@gmail.com",
        district: "San Miguel",
        phone: 985654123,
        imageLogo: "data:image/jpeg;base64,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"),
    Laundry(
        name: "Aqui lavamos bien",
        address: "Av. Universitaria",
        price: 9.99,
        email: "aquilavamos@gmail.com",
        district: "Cercado de Lima",
        phone: 990587526,
        imageLogo: "sample"),
    Laundry(
        name: "Lavanderia Akiraki",
        address: "Av. La marina",
        price: 9.99,
        email: "akira@gmail.com",
        district: "San Miguel",
        phone: 958158852,
        imageLogo: "sample"),
    Laundry(
        name: "Lavanderia Cledmir",
        address: "Av. faucett",
        price: 10,
        email: "cledmir@gmail.com",
        district: "San Miguel",
        phone: 985654123,
        imageLogo: "sample"),
    Laundry(
        name: "Aqui lavamos bien",
        address: "Av. Universitaria",
        price: 9.99,
        email: "aquilavamos@gmail.com",
        district: "Cercado de Lima",
        phone: 990587526,
        imageLogo: "sample"),
    Laundry(
        name: "Lavanderia Akiraki",
        address: "Av. La marina",
        price: 9.99,
        email: "akira@gmail.com",
        district: "San Miguel",
        phone: 958158852,
        imageLogo: "sample"),
    Laundry(
        name: "Lavanderia Cledmir",
        address: "Av. faucett",
        price: 10,
        email: "cledmir@gmail.com",
        district: "San Miguel",
        phone: 985654123,
        imageLogo: "sample"),
    Laundry(
        name: "Aqui lavamos bien",
        address: "Av. Universitaria",
        price: 9.99,
        email: "aquilavamos@gmail.com",
        district: "Cercado de Lima",
        phone: 990587526,
        imageLogo: "sample"),
  ];
  List<Laundry> laundriesFiltered = <Laundry>[];
  final TextStyle biggerFont = TextStyle(fontSize: 18);
  late BuildContext context;

  @override
  initState() {
    laundriesFiltered = laundries;
    super.initState();
  }

  void filter(String enteredKeyword) {
    print(enteredKeyword);
    List<Laundry> results = <Laundry>[];
    if (enteredKeyword.isEmpty) {
      results = laundries;
    } else {
      results = laundries
          .where((laundry) =>
              laundry.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {
      laundriesFiltered = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Lavanderías"),
      ),
      body: buildLaundries(),
    );
  }

  Widget buildLaundries() {
    return Column(children: [
      TextField(
        onChanged: (value) => filter(value),
        decoration: InputDecoration(
            labelText: 'Buscar', suffixIcon: Icon(Icons.search)),
      ),
      SizedBox(
        height: 2,
      ),
      Expanded(
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: laundriesFiltered.length,
          itemBuilder: (BuildContext context, int i) {
            return buildLaundryCard(laundriesFiltered[i]);
          },
        ),
      )
    ]);
  }

  Widget buildLaundryCard(Laundry laundry) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () => goDetails(laundry),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: FlutterLogo(size: 56.0),
                  title: Text(laundry.name),
                  subtitle: Text(
                      "${laundry.address}\n${laundry.district}\n${laundry.email}\n${laundry.phone}"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void goDetails(Laundry laundry) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (_) => LaundryDetailScreen(laundry: laundry)));
  }
}
