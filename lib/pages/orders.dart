import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:washi_flutter_app/entities/Order.dart';
import 'package:washi_flutter_app/pages/washer_navbar.dart';
import 'package:washi_flutter_app/util/user_helper.dart';

class Orders1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: WasherNavBar(),
        appBar: AppBar(
          title: Text("Pedidos"),
        ),
        body: Center(child: OrdersList1()));
  }
}

class OrdersList1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<OrdersList1> {
  String url = "http://washi-api.azurewebsites.net/api";
  List orders = [];
  List orderStatuses = [];

  List userData = [];
  List clientData = [];
  List orderDetails = [];
  List laundryServiceMaterials = [];
  List laundries = [];

  Future<String> makeRequest() async {
    var response = await http.get(
      Uri.parse(url + "/orders/users/1/"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      orders = extractData;
    });

    return response.body.toString();
  }

  Future<String> statusRequest() async {
    var response = await http.get(
      Uri.parse(url + "/orderstatuses/"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      orderStatuses = extractData;
    });

    return "success";
  }

  Future<String> clientesData() async {
    var response = await http.get(
      Uri.parse(url + "/userprofiles/1/"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      clientData = extractData;
    });

    return response.body.toString();
  }

  Future<String> detailsData() async {
    var response = await http.get(
      Uri.parse(url + "/orderdetails/"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      orderDetails = extractData;
    });

    return "success";
  }

  Future<String> laundryServiceMaterialRequest() async {
    var response = await http.get(
      Uri.parse(url + "/laundryservicematerials/"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      laundryServiceMaterials = extractData;
    });

    return response.body.toString();
  }

  Future<String> laundriesData() async {
    var response = await http.get(
      Uri.parse(url + "/userprofiles/laundries/"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      laundries = extractData;
    });

    Future<String> usersData()async{
      var response = await http.get(
        Uri.parse(url + "/users/"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
        },
      );

      //This permits us to reload data
      setState(() {
        var extractData = json.decode(response.body);
        userData = extractData;
      });

      return "success";
    }

    return response.body.toString();
  }

  @override
  initState() {
    this.makeRequest();
    this.statusRequest();
    this.detailsData();
    super.initState();
  }

  final TextStyle biggerFont = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          itemCount: orders == null ? 0 : orders.length,
          itemBuilder: (BuildContext context, int i) {
            int orderStatusId = 0;
            int orderDetailId = 0;

            for (var j = 0; j < orderStatuses.length; j++) {
              if (orderStatuses[j]['id'] == orders[i]['orderStatusId']) {
                orderStatusId = j;
              }
            }

            for (var k = 0; k < orderDetails.length; k++) {
              if (orderDetails[k]['orderId'] == orders[i]['id']) {
                orderDetailId = k;
              }
            }

            /*int userId = 0;
            int laundryId = 0;
            int orderId = 0;
            int orderDetailId = 0;
            int laundryServiceMaterialId = 0;

            for (var j = 0; j < userData.length; j++) {
              if (userData[j]['id'] == clientData[i]['userId']) {
                userId = j;
              }
            }

            for (var j = 0; j < clientData.length; j++) {
              if (clientData[j]['userId'] == orders[i]['userId']) {
                orderId = j;
              }
            }

            for (var j = 0; j < orders.length; j++) {
              if (orders[j]['userId'] == orderDetails[i]['orderId']) {
                orderDetailId = j;
              }
            }

            for (var j = 0; j < laundryServiceMaterials.length; j++) {
              if (laundryServiceMaterials[j]['id'] == orderDetails[i]['laundryServiceMaterialId']) {
                laundryServiceMaterialId = j;
              }
            }
            for (var j = 0; j < laundries.length; j++) {
              if (laundries[j]['userId'] == laundryServiceMaterials[i]['laundryId']) {
                laundryId = j;
              }
            }*/
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
                                    topLeft: Radius.circular(5)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("lib/assets/picture.jpeg"),
                                )),
                          ),
                          Container(
                            height: 100,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    orders[i]['id'].toString(),
                                    style: biggerFont,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
                                    child: Container(
                                      child: Text(
                                        orders[i]["orderAmount"].toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 3),
                                    child: Container(
                                      child: Text(
                                        orderStatuses[orderStatusId]["name"].toString(),
                                        style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // onTap: () => details(orders[index])),
                  ),
                ));
      },
    ));
  }

  /*
  void details(Order order) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Detalle del pedido"),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
                  child: Text(
                    order.laundryName,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 10, 0, 15),
                        child: Text(
                          "Fecha",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(160, 10, 0, 15),
                        child: Text(
                          order.date,
                          style: TextStyle(fontSize: 18),
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
                          "Fecha de entrega:",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(65, 10, 0, 15),
                        child: Text(
                          order.deliveryDate,
                          style: TextStyle(fontSize: 18),
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
                          "Estado:",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(150, 10, 0, 15),
                        child: Text(
                          order.status,
                          style: TextStyle(fontSize: 18),
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
                          "Lavado al seco de lana x 1kg",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 10, 0, 15),
                        child: Text(
                          "S/. 12.00",
                          style: TextStyle(fontSize: 16),
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
                          "Lavado en agua de algodón x 2kg",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(27, 10, 0, 15),
                        child: Text(
                          "S/. 17.00",
                          style: TextStyle(fontSize: 16),
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
                          "Lavado de zapatillas de tela x 1par",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 15),
                        child: Text(
                          "S/. 10.00",
                          style: TextStyle(fontSize: 16),
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
                          "Delivery",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(210, 10, 0, 15),
                        child: Text(
                          "S/. 05.00",
                          style: TextStyle(fontSize: 16),
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
                          "Total",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(170, 10, 0, 15),
                        child: Text(
                          order.cost,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
    }));
  }*/
}
