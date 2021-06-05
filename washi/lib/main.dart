import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:washi/NavBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Home")
      ),
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("lib/assets/logo.png"),
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

class Promotions extends StatefulWidget {
  @override
  _PromotionsState createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Promotions"),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, i){
          return ListTile(
            title: Text("Promoción lavado"),
            subtitle: Text("Descuento 10%"),
            leading: CircleAvatar(
              backgroundImage: AssetImage("lib/assets/logo.png"),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: new FloatingActionButton(
        child: Text("New"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => AdminPromotion()));
        },
      ),
    );
  }
}

class AdminPromotion extends StatefulWidget {
  @override
  _AdminPromotionState createState() => _AdminPromotionState();
}

class _AdminPromotionState extends State<AdminPromotion> {
  String dropdownValue = 'Calzado';
  String secondownValue = '10%';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("New Promotion"),
        ),
      body: Form(
        child: Container(
          padding: EdgeInsets.all(35),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Nombre de la promoción"),
                keyboardType: TextInputType.text,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Categoria',
                ),
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                onChanged: (String? newValue){
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Calzado', 'Frazada', 'Lavado','Secado']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                }).toList()
              ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Descuento',
                  ),
                  value: secondownValue,
                  icon: Icon(Icons.arrow_downward),
                  onChanged: (String? newValue){
                    setState(() {
                      secondownValue = newValue!;
                    });
                  },
                  items: <String>['10%', '15%', '20%','25%']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: new FloatingActionButton(
        child: Text("Add"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => Promotions()));
        },
      ),
    );
  }
}

