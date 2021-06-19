import 'package:flutter/material.dart';
import 'NavBar.dart';

class Notifications_Laundry extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications_Laundry>{

  final List<Item> _data = <Item>[
    Item(
      headerValue:'Pedido N° 12345',
      expandedValue:'09:52 p.m. Su pedido N° 12345 esta en camino a su dirección',
      subtitle: 'Nueva Orden'
    ),
    Item(
      headerValue:'Pedido N° 5728872',
      expandedValue:'08:30 a.m. Su pedido N° 5728872 ha sido recogido',
      subtitle: 'Orden entragada'
    ),Item(
      headerValue:'Pedido N° 85232',
      expandedValue:'10:05 p.m. Su pedido N° 85232 esta siendo lavado',
      subtitle: 'En proceso de lavado'
    ),
    Item(
      headerValue:'Pedido N° 74588',
      expandedValue:'09:00 a.m. Su pedido N° 74588 ha sido entregado',
      subtitle: 'Entregado'
    ),
    Item(
      headerValue:'Pedido N° 45278',
      expandedValue:'06:08 p.m. Su pedido N° 45278 esta en camino a su dirección',
      subtitle: 'Tu pedido esta en camino'
    ),
  ];

  Widget _buildListPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded){
        setState((){
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item){
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded){
            return ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(item.headerValue),
              subtitle: Text(item.subtitle)
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
            
          ),
          isExpanded: item.isExpanded
        );
      }).toList(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Notifications_Laundry'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildListPanel(),
        )
      )
    );
  }
}

class Item {
  String expandedValue;
  String headerValue;
  String subtitle;
  bool isExpanded;
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.subtitle,
    this.isExpanded = false,
  });
}
