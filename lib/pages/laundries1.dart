import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:washi_flutter_app/entities/Laundry.dart';
import 'package:washi_flutter_app/pages/washer_navbar.dart';
import 'package:washi_flutter_app/pages/laundryDetail.dart';

class Laundries1 extends StatefulWidget {
  @override
  LaundriesState createState() => LaundriesState();
}

class LaundriesState extends State<Laundries1> {
  final List<Laundry> laundries = <Laundry>[
    Laundry(
        name: "Lavanderia Ropa Blanca",
        address: "Av. La marina",
        price: 9.99,
        email: "ropablanca@gmail.com",
        district: "San Miguel",
        phone: 958158852),
   Laundry(
        name: "Lavanderia Rapida",
        address: "Av. faucett",
        price: 10,
        email: "lavadorapido@gmail.com",
        district: "San Miguel",
        phone: 985654123),
    Laundry(
        name: "Aqui lavamos bien",
        address: "Av. Universitaria",
        price: 9.99,
        email: "aquilavamos@gmail.com",
        district: "Cercado de Lima",
        phone: 990587526),
    Laundry(
        name: "Lavanderia Ropa Blanca",
        address: "Av. La marina",
        price: 9.99,
        email: "ropablanca@gmail.com",
        district: "San Miguel",
        phone: 958158852),
    Laundry(
        name: "Lavanderia Rapida",
        address: "Av. faucett",
        price: 10,
        email: "lavadorapido@gmail.com",
        district: "San Miguel",
        phone: 985654123),
    Laundry(
        name: "Aqui lavamos bien",
        address: "Av. Universitaria",
        price: 9.99,
        email: "aquilavamos@gmail.com",
        district: "Cercado de Lima",
        phone: 990587526),
    Laundry(
        name: "Lavanderia Ropa Blanca",
        address: "Av. La marina",
        price: 9.99,
        email: "ropablanca@gmail.com",
        district: "San Miguel",
        phone: 958158852),
    Laundry(
        name: "Lavanderia Rapida",
        address: "Av. faucett",
        price: 10,
        email: "lavadorapido@gmail.com",
        district: "San Miguel",
        phone: 985654123),
    Laundry(
        name: "Aqui lavamos bien",
        address: "Av. Universitaria",
        price: 9.99,
        email: "aquilavamos@gmail.com",
        district: "Cercado de Lima",
        phone: 990587526),
  ];
  List<Laundry> laundriesFiltered = <Laundry>[];
  final TextStyle biggerFont = TextStyle(fontSize: 18);
  final Set<Laundry> saved = Set<Laundry>();
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
      drawer: WasherNavBar(),
      appBar: AppBar(
        title: Text("Lista de Lavanderías"),
        actions: <Widget>[
          IconButton(
            onPressed: laundrySaved,
            icon: Icon(Icons.article_outlined),
          )
        ],
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
    final bool alreadySaved = saved.contains(laundry);
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          //onTap: () => goDetails(laundry),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading:FlutterLogo(size: 56.0),
                  title: Text(laundry.name),
                  subtitle: Text(
                      "${laundry.address}\n${laundry.district}\n${laundry.email}\n${laundry.phone}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          //if (alreadySaved == true)
                          alreadySaved ? Icons.favorite : Icons.favorite_border,
                          color: alreadySaved ? Colors.red : null,
                        ),
                        onPressed: () {
                          setState(() {
                            if (alreadySaved) {
                              saved.remove(laundry);
                            } else {
                              saved.add(laundry);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*void goDetails(Laundry laundry) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => LaundryDetailScreen(laundry: laundry)));
  }*/

  void laundrySaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = saved.map((Laundry laundry) {
        return ListTile(
          leading: FlutterLogo(size: 56.0),
          title: Text(laundry.name),
          subtitle: Text(
              "${laundry.address}\n${laundry.district}\n${laundry.email}\n${laundry.phone}"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  //if (alreadySaved == true)
                  Icons.expand_more_rounded,
                  color: Colors.deepPurpleAccent,
                ),
                onPressed: () {
                  //goDetails(laundry);
                },
              ),
            ],
          ),
        );
      });
      final List<Widget> divided =
      ListTile.divideTiles(context: context, tiles: tiles).toList();
      return Scaffold(
        appBar: AppBar(
          title: Text("Mis lavanderías favoritas"),
        ),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }
}