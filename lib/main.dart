import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode Entrar!";
  final int _LIMITE = 12;

  void _changePeople(int delta) {
    setState(() {
      _people += delta;
      if (_people < 0) {
        _infoText = "Mundo invertido! :-(";
      } else if (_people <= _LIMITE) {
        _infoText = "Pode Entrar!";

      } else {
        _infoText = "Lotado!";
        _people--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/bg.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              borderOnForeground: true,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              color: Colors.black12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Pessoas: $_people",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: FlatButton(
                          child: Icon(
                            Icons.add_circle,
                            color: Colors.green,
                            size: 40,
                          ),
                          onPressed: () {
                            _changePeople(1);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: FlatButton(
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                            size: 40,
                          ),
                          onPressed: () {
                            _changePeople(-1);
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      _infoText,
                      style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 30.0,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
