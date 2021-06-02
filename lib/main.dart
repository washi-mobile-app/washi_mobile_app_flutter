import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Washi App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: OrdersPage(),
    );
  }
}

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pedidos"),
        ),
        body: Center(child: OrdersList()));
  }
}

class OrdersList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<OrdersList> {
  List items = getOrdersList();
  final TextStyle biggerFont = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new Container(
              child: Card(
                elevation: 5,
                child: InkWell(
                  child: Container(
                    height: 100.0,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  topLeft: Radius.circular(5)
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("lib/assets/picture.jpeg"),
                              )
                          ),
                        ),
                        Container(
                          height: 100,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  items[index],
                                  style: biggerFont,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
                                  child: Container(
                                    child: Text("S/. 44.60",textAlign: TextAlign.center, style: TextStyle(
                                        fontSize: 18
                                    ),),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 3),
                                  child: Container(
                                    child: Text("En camino",style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.blueAccent,
                                    ),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  title: Text("Detalle del pedido"),
                                ),
                                body: Center(child: OrderDetail()));
                            })
                    );
                  },
                ),
              ),
            );
          },
        ));
  }

  static List getOrdersList() {
    List list = List.generate(3, (i) {
      return "Lavandería Don Pepe";
    });
    return list;
  }
}
class OrderDetail extends StatefulWidget {
  @override
  OrderDetailState createState() => OrderDetailState();
}

class OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
              child: Text(
                "Lavandería Don Pepe", style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 0, 15),
                    child: Text(
                      "Fecha", style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(160, 10, 0, 15),
                    child: Text(
                      "05/05/21", style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 0, 15),
                    child: Text(
                      "Fecha de entrega:", style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(65, 10, 0, 15),
                    child: Text(
                      "08/05/21", style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 0, 15),
                    child: Text(
                      "Estado:", style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(150, 10, 0, 15),
                    child: Text(
                      "Entregado", style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 0, 15),
                    child: Text(
                      "Lavado al seco de lana x 1kg", style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 0, 15),
                    child: Text(
                      "S/. 12.00", style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 0, 15),
                    child: Text(
                      "Lavado en agua de algodón x 2kg", style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(27, 10, 0, 15),
                    child: Text(
                      "S/. 17.00", style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 0, 15),
                    child: Text(
                      "Lavado de zapatillas de tela x 1par", style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 15),
                    child: Text(
                      "S/. 10.00", style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 0, 15),
                    child: Text(
                      "Delivery", style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(210, 10, 0, 15),
                    child: Text(
                      "S/. 05.00", style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 0, 15),
                    child: Text(
                      "Total", style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(170, 10, 0, 15),
                    child: Text(
                      "S/. 44.60", style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
      ),
    );
  }
}
