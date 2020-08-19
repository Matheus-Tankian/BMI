import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';


enum Gender{MAN, WOMAN, OTHER}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      home: App() ,
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Gender _genderValue;
  double _numberWeight = 0;
  double _numberTall = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imc'),
      ),

      body:Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: info(),
              flex: 1,
            ),
            Expanded(
              child: dados(),
              flex: 2,
            ),
            Expanded(
              child: idade(),
              flex: 2,
            ),
           Card(
             child: calc(),
           ),
          ],
        ),
      ),

    );
  }

 Widget info(){
    return Align(
      alignment: Alignment.topCenter,
      child:Text(
        'informações do paciente',
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
    );
 }
Widget dados(){
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),

        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Peso - kg',
                ),
                onChanged: (text){
                  var aux = double.tryParse(text);
                  if(aux!=null){
                    setState(() {
                      _numberWeight = aux;
                    });
                  }
                },

              ),
              flex: 4,
            ),

            Flexible(
              child: Container(
              ),
              flex: 1,
            ),

            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Altura - cm',
                ),
                onChanged: (text){
                  var aux = double.tryParse(text);
                  if(aux!=null){
                    setState(() {
                      _numberTall = aux;
                    });
                  }
                },

              ),
              flex: 4,
            ),
          ],
        ),
      ),
    );
}

Widget idade(){
    return Row(
      
      children: <Widget>[
        FlatButton.icon(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            onPressed: (){
              setState(() {
                _genderValue = Gender.MAN;
              });
            },
            icon: Radio(
              value: Gender.MAN,
              groupValue: _genderValue,
              onChanged: (Gender value){
                setState(() {
                  _genderValue = value;
                });
              },
            ),
            label: const Text("Man")),

        FlatButton.icon(
            onPressed: (){
              setState(() {
                _genderValue = Gender.WOMAN;
              });
            },
            icon: Radio(
              value: Gender.WOMAN,
              groupValue: _genderValue,
              onChanged: (Gender value){
                setState(() {
                  _genderValue = value;
                });
              },
            ),
            label: const Text("Woman",style: TextStyle(fontSize: 14))),

        FlatButton.icon(
            onPressed: (){
              setState(() {
                _genderValue = Gender.OTHER;
              });
            },
            icon: Radio(
              value: Gender.OTHER,
              groupValue: _genderValue,
              onChanged: (Gender value){
                setState(() {
                  _genderValue = value;
                });
              },
            ),
            label: const Text("Other",style: TextStyle(fontSize: 14)),

        ),
      ],
    );
}


Widget calc(){
  return FlatButton(
    onPressed: () {
      debugPrint('I am Awesome');
    },
    textColor: Colors.white,
    color: Colors.blueAccent,
    disabledColor: Colors.grey,
    disabledTextColor: Colors.white,
    highlightColor: Colors.orangeAccent,
    child: Text('Flat Button'),
  );
}


  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('_numberWeight', _numberWeight));
    properties.add(DoubleProperty('_numberTall', _numberTall));
  }

}
