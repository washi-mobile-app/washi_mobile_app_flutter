import 'dart:math';

import 'package:flutter/material.dart';

import 'laundry_navbar.dart';

class LaundryNotifications extends StatefulWidget {
  @override
  _LaundryNotificationsState createState() => _LaundryNotificationsState();
}

class _LaundryNotificationsState extends State<LaundryNotifications> {
  final List<Item> _data = generateItems(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LaundryNavBar(),
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
                  _data.remove(item);
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
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.subValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  String subValue;
  bool isExpanded;
}

String orderState(int value) {
  switch (value) {
    case 0:
      return 'Se ha realizado una nueva orden';
      break;
    default:
      return 'Se entregó el pedido';
  }
}

String laundryName(int value) {
  switch (value) {
    case 0:
      return 'Pepito';
      break;
    case 1:
      return 'Carlos';
      break;
    default:
      return 'Juan';
  }
}

List<Item> generateItems(int numberOfItems) {
  var random = new Random();
  return List<Item>.generate(numberOfItems, (int index) {
    String state = orderState(random.nextInt(2));
    String name = laundryName(random.nextInt(3));
    return Item(
      headerValue: 'Pedido N° $index',
      subValue: '$state',
      expandedValue: '$state del usuario $name',
    );
  });
}
