import 'package:flutter/material.dart';

class Promotions extends StatefulWidget {
  @override
  _PromotionsState createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promociones'),
        backgroundColor: Color.fromRGBO(121, 47, 218, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10),
        child: Center(
          child: Column(
            children: <Widget>[
              cards(),
            ],
          ),
        ),
      ),
    );
  }

  cards(){
    return Column(
      children: <Widget>[
        Card(
          child: Container(
            width: 360, padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(
                  'Fin de semana',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
                SizedBox(height: 20,),
                Text('Los fines de semana puedes lavar un 2 kg  por el precio de 1 kg')
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            width: 360, padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(
                  'Ropa blanca',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
                SizedBox(height: 20,),
                Text('Por cada 2 kg de ropa blanca obtén un descuento del 50% ')
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            width: 360, padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(
                  'Lunes de descuentos',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
                SizedBox(height: 20,),
                Text('Por cada 5 kg de ropa obtén un descuento del 70%')
              ],
            ),
          ),
        ),
      ],
    );
  }
}
