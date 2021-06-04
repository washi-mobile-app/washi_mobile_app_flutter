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
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
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
  final TextStyle biggerFont = TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name generator..."),
      ),
      body: buildLaundries(),
    );
  }

  Widget buildLaundries() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: laundries.length,
      itemBuilder: (BuildContext context, int i) {
        return buildLaundryCard(laundries[i]);
      },
    );
  }

  Widget buildLaundryCard(Laundry laundry) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
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
    );
  }
}
