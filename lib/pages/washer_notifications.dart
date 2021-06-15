import 'package:flutter/material.dart';


class WasherNotifications extends StatefulWidget {
  @override
  _WasherNotificationsState createState() => _WasherNotificationsState();
}

class _WasherNotificationsState extends State<WasherNotifications> {
  final List<Item> _data = generateItems(8);

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

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    String hour = '10:00';
    return Item(
      headerValue: 'Pedido N° $index',
      subValue: 'Su pedido esta en camino',
      expandedValue: '$hour Gracias por haber comprado en $index',
    );
  });
}



