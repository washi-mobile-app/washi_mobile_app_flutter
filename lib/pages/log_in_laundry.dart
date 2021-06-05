import 'package:flutter/material.dart';
import 'package:washi_mobile_app/pages/promotions.dart';

class LogInLaundry extends StatefulWidget {
  @override
  _LogInLaundryState createState() => _LogInLaundryState();
}

class _LogInLaundryState extends State<LogInLaundry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laundry'),
        backgroundColor: Color.fromRGBO(121, 47, 218, 1),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 50,right: 40,top: 0),
          children: <Widget>[
            Form(
                child: Container(
                    width: 350,
                    child: Column(
                      children: <Widget>[
                        Text('Iniciar Sesión',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        Padding(padding: EdgeInsets.only(top: 50)),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Email',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(121, 47, 218, 1),
                                ),
                              )
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        Padding(padding: EdgeInsets.only(top: 50)),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Contraseña',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(121, 47, 218, 1),
                                ),
                              )
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Padding(padding: EdgeInsets.only(top: 80)),
                        MaterialButton(
                          height: 50,
                          minWidth: 90,
                          color: Color.fromRGBO(121, 47, 218, 1),
                          textColor: Colors.white,
                          child: Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Promotions()
                                )
                            );
                          },
                        ),
                      ],
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}
