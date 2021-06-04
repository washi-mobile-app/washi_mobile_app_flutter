import 'package:flutter/material.dart';
import 'package:washi_mobile_app_flutter/entities/laundry.dart';

class LaundryDetailScreen extends StatelessWidget{
  final Laundry laundry;
  const LaundryDetailScreen({Key? key, required this.laundry}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Laundry laundry = new Laundry(
        name: "Lavanderia Akiraki",
        address: "Av. La marina",
        price: 9.99,
        email: "akira@gmail.com",
        district: "San Miguel",
        phone: 958158852,
        imageLogo: "sample"
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(laundry.name)
      ),
      body: Row(
        children: <Widget>[
          Expanded(
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(
                  laundry.imageLogo,
                  fit: BoxFit.cover,
                ),
              )
          )
        ],
      ),
    );
  }

}