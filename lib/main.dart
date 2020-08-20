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
  double _numberAge = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imc'),
      ),

      body:Container(
        child: fristView(),
      ),

    );
  }

  Widget fristView(){
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[

        Container(
          height: 500,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Flexible(

                        child: textView(),
                      flex: 1,
                    ),

                  ],
                ),
                flex:1,

              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: manView(),
                      flex: 3,
                    ),

                    Flexible(
                      child: womanView(),
                      flex: 4,
                    ),

                    Flexible(
                      child: otherView(),
                      flex: 3,
                    ),

                  ],

                ),
                flex: 1,
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: idadeView(),
                      flex: 1,
                    ),

                    Flexible(
                      child: inputView(),
                      flex: 2,
                    ),

                    Flexible(
                      child: naView(),
                      flex: 1,
                    ),

                  ],

                ),
                flex: 1,
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: pesoView(),
                      flex: 1,
                    ),

                    Flexible(
                      child: inputpesoView(),
                      flex: 2,
                    ),

                    Flexible(
                      child: kgView(),
                      flex: 1,
                    ),

                  ],

                ),
                flex: 1,
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: alturaView(),
                      flex: 1,
                    ),

                    Flexible(
                      child: inputalturaView(),
                      flex: 2,
                    ),

                    Flexible(
                      child: mView(),
                      flex: 1,
                    ),

                  ],

                ),
                flex: 1,
              ),

              Expanded(
                child: buttonCalc(),
                flex: 1,
              ),

            ],
          ),
        ),




      ],
    );
  }






Widget buttonCalc(){

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: FlatButton(
      onPressed: () {

        print(_genderValue);
        print(_numberAge);
        print(_numberWeight);
        print(_numberTall);

      },

      textColor: Colors.white,
      color: Colors.blueAccent,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.white,
      highlightColor: Colors.orangeAccent,
      child: Text('CALCULAR IMC',
        style: TextStyle(
            fontSize: 30
        ),),
    ),
  );
}




  Widget textView(){
    return  Center(
      child: Text(
        "Descubra qual é seu índice de Massa Corporal",
        style: TextStyle(

          color: Colors.black,
        ),
      ),
    );

  }

  Widget manView(){
    return  FlatButton.icon(
        padding: const EdgeInsets.symmetric(vertical: 5),
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
        label: const Text("Man"));
  }

  Widget womanView(){
    return  FlatButton.icon(
        padding: const EdgeInsets.symmetric(vertical: 5),
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
        label: const Text("Woman"));
  }

  Widget otherView(){
    return  FlatButton.icon(
        padding: const EdgeInsets.symmetric(vertical: 5),
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
        label: const Text("Other"));
  }

  Widget idadeView(){
    return Align(
        alignment: Alignment.center,
        child: Text(
          'Idade',
          style: TextStyle(
            fontSize: 22
          ),

        ),
      );

  }

    Widget inputView(){
      return TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Idade',
        ),
        onChanged: (text){
          var aux  = double.tryParse(text);
          if(aux !=null){
            setState(() {
              _numberAge = aux;
            });
          }
        }
      );
    }

    Widget naView(){
      return Container(
        height: 30,
        width: 30,
      );
    }

  Widget pesoView(){
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Peso',
        style: TextStyle(
            fontSize: 22
        ),

      ),
    );

  }

  Widget inputpesoView(){
    return TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'peso',
        ),
        onChanged: (text){
          var aux  = double.tryParse(text);
          if(aux !=null){
            setState(() {
              _numberWeight = aux;
            });
          }
        }
    );
  }

  Widget kgView(){
    return Container(
      height: 30,
      width: 30,
      child: Center(
        child: Text(
          'KG',
          style: TextStyle(
            fontSize: 20,
          ),

        ),
      )
    );
  }


  Widget alturaView(){
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Altura',
        style: TextStyle(
            fontSize: 22
        ),

      ),
    );

  }

  Widget inputalturaView(){
    return TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Altura',
        ),
        onChanged: (text){
          var aux  = double.tryParse(text);
          if(aux !=null){
            setState(() {
              _numberTall = aux;
            });
          }
        }
    );
  }

  Widget mView(){
    return Container(
        height: 30,
        width: 30,
        child: Center(
          child: Text(
            'M',
            style: TextStyle(
              fontSize: 20,
            ),

          ),
        )
    );
  }

}
