import 'package:flutter/material.dart';
import 'package:washi/main.dart';
import 'package:washi/Promotions.dart';
import 'package:washi/NavBar.dart';

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