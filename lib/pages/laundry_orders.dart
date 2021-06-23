import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:washi_flutter_app/pages/laundry_navbar.dart';
import 'package:washi_flutter_app/pages/laundry_orders_1.dart';
import 'package:washi_flutter_app/util/user_helper.dart';

class LaundryOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LaundryNavBar(),
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
  String url = "http://washi-api.azurewebsites.net/api";
  List data = [];
  List userData = [];

  Future<String> makeRequest() async {
    var response = await http.get(
      Uri.parse(url + "/orders/users/" + UserHelper.userid),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      data = extractData;
    });

    return response.body.toString();
  }

  Future<String> clientData() async {
    var response = await http.get(
      Uri.parse(url + "/userprofiles/"),
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

  @override
  void initState() {
    print(url + "/orders/users/" + UserHelper.userid);
    this.makeRequest();
    this.clientData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, i) {
          int userId = 0;

          for (var j = 0; j < userData.length; j++) {
            if (userData[j]['userId'] == data[i]['userId']) {
              userId = j;
            }
          }

          int statusId = data[i]["orderStatusId"];
          String orderStatus;

          if (statusId == 1) {
            orderStatus = "Recibido";
          } else if (statusId == 2) {
            orderStatus = "En camino";
          } else {
            orderStatus = "Entregado";
          }

          return Container(
            padding: EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 10),
            width: 200,
            child: Container(
              padding:
                  EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(121, 47, 218, 1))),
              child: InkWell(
                child: Row(
                  children: [
                    Icon(Icons.store,
                        color: Color.fromRGBO(121, 47, 218, 1), size: 50),
                    Padding(padding: EdgeInsets.only(right: 30)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          userData[userId]['firstName'] +
                              " " +
                              userData[userId]['lastName'],
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 3.0)),
                        Text(
                          "s/ " + (data[i]['orderAmount']).toString() + "0",
                          style: TextStyle(fontSize: 16),
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.0)),
                        Text(
                          orderStatus,
                          style:
                              TextStyle(fontSize: 18, color: Colors.blueAccent),
                        ),
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LaundryOrderDetails(
                              data[i]['id'], data[i]['userId'], orderStatus)));
                },
              ),
            ),
          );
        });
  }
}

class LaundryOrderDetails extends StatefulWidget {
  final int order_id, user_id;
  final String order_status;
  const LaundryOrderDetails(this.order_id, this.user_id, this.order_status);

  @override
  _LaundryOrderDetailsState createState() => _LaundryOrderDetailsState();
}

class _LaundryOrderDetailsState extends State<LaundryOrderDetails> {
  String url = "http://washi-api.azurewebsites.net/api";
  String dropdownValue = "Recibido";

  List data = [];
  List userData = [];
  List orderDetailData = [];
  List laundryServiceMaterialData = [];
  List serviceMaterialData = [];

  int orderId = 0;
  int userId = 0;
  int laundryServiceMaterialId = 0;
  int materialId = 0;
  String material = "";

  Future<String> makeRequest() async {
    var response = await http.get(
      Uri.parse(url + "/orders/"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      data = extractData;
    });

    return response.body.toString();
  }

  Future<String> clientData() async {
    var response = await http.get(
      Uri.parse(url + "/userprofiles/"),
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

  Future<String> orderDetailId() async {
    var response = await http.get(
      Uri.parse(url + "/orderdetails/orders/" + widget.order_id.toString()),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      orderDetailData = extractData;
    });

    return "success";
  }

  Future<String> laundryServiceMaterials() async {
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
      laundryServiceMaterialData = extractData;
    });

    return "success";
  }

  Future<String> serviceMaterials() async {
    var response = await http.get(
      Uri.parse(url + "/servicematerials/"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
    );

    //This permits us to reload data
    setState(() {
      var extractData = json.decode(response.body);
      serviceMaterialData = extractData;
    });

    return "success";
  }

  Future<String> updateOrderStatus(
      String orderStatus,
      int userId,
      String deliveryAddress,
      double orderAmount,
      String date,
      String deliveryDate) async {
    int orderStatusId = 0;

    if (orderStatus == "Recibido") {
      orderStatusId = 1;
    } else if (orderStatus == "En camino") {
      orderStatusId = 2;
    } else {
      orderStatusId = 3;
    }

    final response = await http.put(
      Uri.parse(url + "/orders/1"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + UserHelper.token
      },
      body: jsonEncode({
        "userId": userId,
        "orderStatusId": orderStatusId,
        "deliveryAddress": deliveryAddress,
        "orderAmount": orderAmount,
        "date": date,
        "deliveryDate": deliveryDate
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return "success";
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update order.' +
          userId.toString() +
          "//" +
          orderStatusId.toString() +
          "//" +
          deliveryAddress +
          "//" +
          orderAmount.toString() +
          "//" +
          date +
          "//" +
          deliveryDate);
    }
  }

  @override
  void initState() {
    this.makeRequest();
    this.clientData();
    this.orderDetailId();
    this.laundryServiceMaterials();
    this.serviceMaterials();
    dropdownValue = widget.order_status;
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < userData.length; i++) {
      if (userData[i]['userId'] == widget.user_id) {
        userId = i;
      }
    }

    for (var i = 0; i < data.length; i++) {
      if (userData[i]['id'] == widget.order_id) {
        orderId = i;
      }
    }

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
                userData[userId]["firstName"] +
                    " " +
                    userData[userId]["lastName"],
                style: TextStyle(
                    fontSize: 24, color: Color.fromRGBO(121, 47, 218, 1)),
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 20, 0, 10),
                    child: Text(
                      "Fecha de recepción: ",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 0, 10),
                    child: Text(
                      data[orderId]["date"],
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
                    padding: const EdgeInsets.fromLTRB(35, 10, 0, 10),
                    child: Text(
                      "Fecha de entrega:",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10, 0, 10),
                    child: Text(
                      data[orderId]["deliveryDate"],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Recibido', 'En camino', 'Entregado']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Flexible(
                child: ListView.builder(
                    itemCount:
                        orderDetailData == null ? 0 : orderDetailData.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, j) {
                      for (var i = 0;
                          i < laundryServiceMaterialData.length;
                          i++) {
                        if (laundryServiceMaterialData[i]['id'] ==
                            orderDetailData[j]['laundryServiceMaterialId']) {
                          laundryServiceMaterialId = i;
                          for (var k = 0; k < serviceMaterialData.length; k++) {
                            if (serviceMaterialData[k]['id'] ==
                                laundryServiceMaterialData[
                                        laundryServiceMaterialId]
                                    ['serviceMaterialId']) {
                              materialId = serviceMaterialData[k]['materialId'];

                              if (materialId == 1) {
                                material = "Algodón";
                              } else if (materialId == 2) {
                                material = "Lino";
                              } else if (materialId == 3) {
                                material = "Poliester";
                              } else if (materialId == 4) {
                                material = "Lana";
                              } else if (materialId == 5) {
                                material = "Seda";
                              } else if (materialId == 6) {
                                material = "Nylon";
                              } else {
                                material = "Licra";
                              }
                            }
                          }
                        }
                      }

                      return Container(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(90, 20, 0, 20),
                              child: Text(
                                material,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(120, 20, 0, 20),
                              child: Text(
                                "s/ " +
                                    laundryServiceMaterialData[
                                            laundryServiceMaterialId]["price"]
                                        .toString() +
                                    "0",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
            Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(90, 30, 0, 40),
                    child: Text(
                      "Total",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(140, 30, 0, 40),
                    child: Text(
                      "s/ " + data[orderId]["orderAmount"].toString() + "0",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                updateOrderStatus(
                    dropdownValue,
                    widget.user_id,
                    data[orderId]["deliveryAddress"],
                    data[orderId]["orderAmount"],
                    data[orderId]["date"],
                    data[orderId]["deliveryDate"]);
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => LaundryOrders1()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
