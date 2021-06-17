import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:washi_flutter_app/entities/laundry_order.dart';

class LaundryOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ordenes"),
      ),
      body: Container(
        child: OrdersList(),
      ),
    );
  }
}

class OrdersList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<OrdersList> {
  final List<LaundryOrder> laundryOrders = <LaundryOrder>[
    LaundryOrder(
        washerName: "John Doe",
        cost: "S/. 44.60",
        status: "En camino",
        date: "05/05/21",
        deliveryDate: "08/05/21"),
    LaundryOrder(
        washerName: "Juan Vargas",
        cost: "S/. 30.50",
        status: "En camino",
        date: "06/06/21",
        deliveryDate: "08/06/21"),
    LaundryOrder(
        washerName: "Dalila Solar",
        cost: "S/. 35.00",
        status: "Entregado",
        date: "28/04/21",
        deliveryDate: "02/05/21"),
  ];


  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'En camino';
    return Container(
        child: Wrap(
          direction: Axis.horizontal,
          children: laundryOrders.map((item) =>
              Container(
                padding: EdgeInsets.only(left:15,top: 10,right:10, bottom:10),
                alignment: Alignment.center,
                width: 200,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left:15,top: 10,right:10, bottom:10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color.fromRGBO(121, 47, 218, 1))
                  ),
                  child: InkWell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(item.washerName, style: TextStyle(fontSize: 20),),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
                            child: Container(
                              child: Text(item.cost,textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 3),
                            child: Container(
                              child: Text(item.status,style: TextStyle(fontSize: 19, color: Colors.blueAccent,),),
                            ),
                          )
                        ],
                      ),
                      onTap: () => details(item,dropdownValue)
                  ),
                ),
              )).toList().cast<Widget>(),
        )
    );
  }

  void details(LaundryOrder laundryOrder, String dropdownValue) {
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return Scaffold(
                  appBar: AppBar(
                    title: Text("Detalles de la orden"),
                  ),
                  body: Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
                          child: Text(
                            laundryOrder.washerName, style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(40, 20, 0, 10),
                                child: Text(
                                  "Fecha de recepción: ", style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(80, 20, 0, 10),
                                child: Text(
                                  laundryOrder.date, style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(40, 10, 0, 10),
                                child: Text(
                                  "Fecha de entrega:", style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(100, 10, 0, 10),
                                child: Text(
                                  laundryOrder.deliveryDate, style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward_sharp),
                              iconSize: 24,
                              elevation: 16,
                              items: <String>['En camino', 'Entregado',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                            )
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
                                padding: const EdgeInsets.fromLTRB(40, 20, 0, 40),
                                child: Text(
                                  "Total", style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(220, 20, 0, 40),
                                child: Text(
                                  laundryOrder.cost, style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                          height: 50,
                          minWidth: 90,
                          color: Color.fromRGBO(121, 47, 218, 1),
                          textColor: Colors.white,
                          child: Text(
                            'Actualizar',
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                          onPressed: (){
                          },
                        ),
                      ],
                    ),
                  ));
            })
    );
  }
}