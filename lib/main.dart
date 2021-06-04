import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:washi_mobile_app_flutter/entities/Laundry.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Name generator...",
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Lavanderías"),
      ),
      body: buildLaundries(),
    );
  }

  Widget buildLaundries() {
    // return ListView.builder(
    //   padding: EdgeInsets.all(16),
    //   itemCount: laundries.length,
    //   itemBuilder: (BuildContext context, int i) {
    //     return buildLaundryCard(laundries[i]);
    //   },
    // );
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
          onTap: () {},
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
}
