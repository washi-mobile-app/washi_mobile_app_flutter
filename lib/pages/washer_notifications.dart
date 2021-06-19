import 'package:flutter/material.dart';
import 'dart:math';


class WasherNotifications extends StatefulWidget {
  @override
  _WasherNotificationsState createState() => _WasherNotificationsState();
}

class _WasherNotificationsState extends State<WasherNotifications> {
  final List<Item> _data = generateItems(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
      ),  
      body: SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: FlutterLogo(size: 50),
              title: Text(item.headerValue),
              subtitle: Text(item.subValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({required this.expandedValue, required this.headerValue, required this.subValue, this.isExpanded = false,});

  String expandedValue;
  String headerValue;
  String subValue;
  bool isExpanded;
}
String orderState(int value){
  switch (value) {
    case 0:
      return 'Su pedido esta en camino';
      break;
    case 1:
      return 'Gracias por calificar su pedido';
      break;
    default:
      return 'Se cancelo su pedido';
  }
}

String laundryName(int value){
  switch (value) {
    case 0:
      return 'Lavandería Ropa Blanca';
      break;
    case 1:
      return 'Lavandería rápida';
      break;
    default:
      return 'Aqui lavamos bien';
  }
}

List<Item> generateItems(int numberOfItems) {
  var random = new Random();
  return List<Item>.generate(numberOfItems, (int index) {
    String state = orderState(random.nextInt(3));
    String name = laundryName(random.nextInt(3));
    return Item(
      headerValue: 'Pedido N° $index',
      subValue: '$state',
      expandedValue: 'Gracias por haber lavado en $name',
    );
  });
}



