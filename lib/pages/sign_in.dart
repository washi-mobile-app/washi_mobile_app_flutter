import 'package:flutter/material.dart';

enum SingingCharacter {washer, laundry}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  SingingCharacter? _character = SingingCharacter.washer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrarse"),
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
                        Text('',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Nombres',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(121, 47, 218, 1),
                                ),
                              )
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        Padding(padding: EdgeInsets.only(top: 25)),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Apellidos',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(121, 47, 218, 1),
                                ),
                              )
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        Padding(padding: EdgeInsets.only(top: 25)),
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
                        Padding(padding: EdgeInsets.only(top: 25)),
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
                        Padding(padding: EdgeInsets.only(top: 25)),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: ListTile(
                                title: const Text('Washer'),
                                leading: Radio<SingingCharacter>(
                                  value: SingingCharacter.washer,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                    },
                                ),
                              ),
                            ),
                            Expanded(
                                child:
                                ListTile(
                                  title: const Text('Laundry'),
                                  leading: Radio<SingingCharacter>(
                                    value: SingingCharacter.laundry,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter? value) {
                                      setState(() {
                                        _character = value;
                                      });
                                      },
                                  ),
                                ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 35)),
                        MaterialButton(
                          height: 50,
                          minWidth: 90,
                          color: Color.fromRGBO(121, 47, 218, 1),
                          textColor: Colors.white,
                          child: Text(
                            'Registrarse',
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                          onPressed: (){
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
