import 'package:flutter/material.dart';
import 'package:washi_mobile_app/pages/log_in_laundry.dart';
import 'package:washi_mobile_app/pages/log_in_washer.dart';
import 'package:washi_mobile_app/pages/promotions.dart';
import 'package:washi_mobile_app/pages/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index(),
    );
  }
}

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('lib/assets/laundry.jpg'),
            fit: BoxFit.cover,
            color: Color.fromRGBO(84, 64, 86, 1),
            colorBlendMode: BlendMode.modulate,
          ),
          Column(
            children: <Widget>[
              Form(
                child: Container(
                  padding: EdgeInsets.only(top: 120),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Washi',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 80)),
                          MaterialButton(
                            height: 60,
                            minWidth: 300,
                            color: Colors.white,
                            textColor: Color.fromRGBO(121, 47, 218, 1),
                            child: Text(
                              'Washer',
                              style: TextStyle(
                                  fontSize: 16
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogInWasher()
                                  )
                              );
                            },
                          ),
                      Padding(padding: EdgeInsets.only(top: 35)),
                      MaterialButton(
                        height: 60,
                        minWidth: 300,
                        color: Colors.white,
                        textColor: Color.fromRGBO(121, 47, 218, 1),
                        child: Text(
                          'Laundry',
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogInLaundry()
                              )
                          );
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 60)),
                      MaterialButton(
                        height: 60,
                        minWidth: 90,
                        textColor: Colors.white,
                        child: Text(
                          'Crear una cuenta',
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()
                              )
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],

          )
        ],
      ),
    );
  }
}




