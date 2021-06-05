import 'package:flutter/material.dart';
import 'package:washi_mobile_app_flutter/entities/laundry.dart';


class LaundryDetailScreen extends StatelessWidget{
  final Laundry laundry;
  const LaundryDetailScreen({Key? key, required this.laundry}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'One';
    return Scaffold(
      appBar: AppBar(
        title: Text(laundry.name)
      ),
      body: Column(children: <Widget>[
        Row(

          children: <Widget>[
            Expanded(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(
                    laundry.imageLogo,
                    fit: BoxFit.cover,
                  ),
                )
            ),
            Expanded(
              child: Text('${laundry.district} \n ${laundry.phone} \n ${laundry.email}'),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const
                  Icon(Icons.arrow_downward_sharp),
                  iconSize: 24,
                  elevation: 16,
                  items: <String>['Lavanderia', 'Planchado', 'Secado']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},

                )
            ),
            Expanded(
              child: Text('${laundry.district} \n ${laundry.phone} \n ${laundry.email}'),
            )
          ],
        ),
      ],
      )

    );
  }

}
