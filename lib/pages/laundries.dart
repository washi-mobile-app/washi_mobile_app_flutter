import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:washi_flutter_app/pages/laundryDetail.dart';
import 'package:washi_flutter_app/pages/washer_navbar.dart';
import 'package:washi_flutter_app/util/user_helper.dart';
class Laundries extends StatefulWidget {
  @override
  LaundriesState createState() => LaundriesState();
}

class LaundriesState extends State<Laundries> {
  String url = "http://washi-api.azurewebsites.net/api";
  List laundries = [];
  List userData = [];
  late BuildContext context;
  final TextStyle biggerFont = TextStyle(fontSize: 18);
  List saved = [];

  Future<String> makeRequest() async {
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

    return response.body.toString();
  }

  Future<String> clientData() async {
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

  @override
  initState() {
    this.makeRequest();
    this.clientData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
        drawer: WasherNavBar(),
        appBar: AppBar(
          title: Text("Lista de Lavanderías"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: laundrySaved,
            )
          ],
        ),
        body: Column(
          children: [
            TextField(
              onChanged: (value) {
                print(value);
                List results = [];
                if (value.isEmpty) {
                  results = laundries;
                } else {
                  for (var j = 0; j < laundries.length; j++) {
                    results = laundries
                        .where(laundries[j]["corporationName"]
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  }
                }

                // Refresh the UI
                setState(() {
                  laundries = results;
                });
              },
              decoration: InputDecoration(
                  labelText: 'Buscar', suffixIcon: Icon(Icons.search)),
            ),
            SizedBox(
              height: 2,
            ),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: laundries == null ? 0 : laundries.length,
                    itemBuilder: (BuildContext context, int i) {
                      int userId = 0;

                      for (var j = 0; j < userData.length; j++) {
                        if (userData[j]['id'] == laundries[i]['userId']) {
                          userId = j;
                        }
                      }

                      int districtId = laundries[i]["districtId"];
                      String district;

                      if (districtId == 1) {
                        district = "San Miguel";
                      } else if (districtId == 2) {
                        district = "Cercado de Lima";
                      } else if (districtId == 3) {
                        district = "San Isidro";
                      } else {
                        district = "Chorrillos";
                      }

                      final bool alreadySaved = saved.contains(laundries[i]);

                      return Center(
                        child: Card(
                          child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () => goDetails(laundries[i]["corporationName"], district, laundries[i]["phoneNumber"], userData[userId]["email"]),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: FlutterLogo(size: 56.0),
                                    title:
                                        Text(laundries[i]["corporationName"]),
                                    subtitle: Text(
                                        "${laundries[i]["address"]}\n${district}\n${userData[userId]["email"]}\n${laundries[i]["phoneNumber"]}"),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            //if (alreadySaved == true)
                                            alreadySaved
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: alreadySaved
                                                ? Colors.red
                                                : null,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (alreadySaved) {
                                                saved.remove(laundries[i]);
                                              } else {
                                                saved.add(laundries[i]);
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ));
  }

  void goDetails(String title, String district, int phone, String email) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => LaundryDetailScreen(title: title, district: district, phone: phone, email: email)));
  }

  void laundrySaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Mis lavanderías favoritas"),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: saved == null ? 0 : saved.length,
          itemBuilder: (BuildContext context, int i) {
            int userId = 0;

            for (var j = 0; j < userData.length; j++) {
              if (userData[j]['id'] == userData[i]['userId']) {
                userId = j;
              }
            }

            int districtId = saved[i]["districtId"];
            String district;

            if (districtId == 1) {
              district = "San Miguel";
            } else if (districtId == 2) {
              district = "Cercado de Lima";
            } else if (districtId == 3) {
              district = "San Isidro";
            } else {
              district = "Chorrillos";
            }

            return Center(
              child: Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: FlutterLogo(size: 56.0),
                          title: Text(saved[i]["corporationName"]),
                          subtitle: Text(
                              "${saved[i]["address"]}\n${district}\n${userData[userId]["email"]}\n${saved[i]["phoneNumber"]}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  //if (alreadySaved == true)
                                  Icons.expand_more_rounded,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onPressed: () {
                                  goDetails(saved[i]["corporationName"], district, saved[i]["phoneNumber"], userData[userId]["email"]);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    }));
  }
}
