import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



enum Gender{MAN, WOMAN, OTHER}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator BMI',
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
  double _imc = 0;
  double _lose = 0;

  String testResult;
  String range1;
  String range2;








  void calcBMI(){
    var aux;
    setState(() {


      aux = (_numberWeight/(_numberTall*_numberTall));

      
      _imc = double.parse(aux.toStringAsFixed(2));
    });
  }

  void calcRange(){
    setState(() {
      if(_numberAge> 18 && _numberAge<65){
        range1 ='18.5';
        range2 = '25';
      }
    });
  }

  void calcReach(){
    setState(() {
      if(_genderValue == Gender.MAN && _imc>25){
        _lose = (10*(_numberTall-1.00))*0.90;
      }else if(_genderValue == Gender.WOMAN && _imc>25){
        _lose = (10*(_numberTall-1.00))*0.85;
      }else if(_genderValue == Gender.OTHER && _imc>25){
        _lose = (10*(_numberTall-1.00))*0.88;
      }else if(_genderValue == Gender.MAN && _imc<18.5){
        _lose =  (10*(_numberTall-1.00))*0.90;
      }else if(_genderValue == Gender.WOMAN && _imc<18.5){
        _lose =  (10*(_numberTall-1.00))*0.85;
      }else if(_genderValue == Gender.OTHER && _imc<18.5){
        _lose =  (10*(_numberTall-1.00))*0.88;
      }else{
        _lose = 0;
      }
    });

    print(_lose);
  }

  void imcAdult(){
   setState(() {
     if(_imc<16){
       testResult = 'Severe Thinness';

     }else if(_imc>=16 && _imc <=17){
       testResult = 'Moderate Thinness';
     }else if(_imc>17 && _imc <=18.5){
       testResult = 'Mild Thinness';
     }else if(_imc>18.5 && _imc <=25){
       testResult = 'Normal';
     }else if(_imc>25 && _imc <=30){
       testResult = 'Overweight';
     }else if(_imc>30 && _imc <=35){
       testResult = 'Obese Class I';
     }else if(_imc>35 && _imc <=40){
       testResult = 'Obese Class II';
     }else if(_imc>40){
       testResult = 'Obese Class III';
     }
   });
//   print(testResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
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
          height: 700,
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
                flex: 2,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: result(),
                ),
                flex: 4,
              ),
            ],
          ),
        ),




      ],
    );
  }






Widget buttonCalc(){

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
    child: FlatButton(
      onPressed: () {
//
//        print(_genderValue);
//        print(_numberAge);
//        print(_numberWeight);
//        print(_numberTall);
        calcBMI();
        imcAdult();
        calcRange();
        calcReach();

      },

      textColor: Colors.white,
      color: Colors.blueAccent,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.white,
      highlightColor: Colors.orangeAccent,
      child: Text('CALCULATE BMI',
        style: TextStyle(
            fontSize: 30
        ),),
    ),
  );
}




  Widget textView(){
    return  Center(
      child: Text(
        "Find out what your Body Mass Index is",
        style: TextStyle(
          fontSize: 16,
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
          'Age',
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
          labelText: 'Age',
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
        'Weight',
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
          labelText: 'Weight',
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
        'Height',
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
          labelText: 'Height',
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

  Widget result(){
    return Container(

      padding: const EdgeInsets.symmetric(horizontal:0),
      color: Colors.grey[300],
      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric( horizontal: 12),
              color: Colors.green,
              child: Center(
                child: Text(
                  'Result',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flex: 2,
          ),

          Flexible(
            child: Row(

              children: <Widget>[

                Expanded(
                  child: Center(
                    child: Text(
                      'BMI = $_imc KG',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                        '($testResult)',
                    style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                  ),
                  flex: 2,
                ),
              ],
            ),
            flex: 3,
          ),

          Flexible(
            child: Column(
              children: <Widget>[
                Expanded(
                  child:Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Healthy BMI range: $range1 KG/m -- $range2 KG/m',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                      ),
                    ),
                  ),
                  flex: 1,
                ),

                Expanded(
                  child:Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Lose $_lose kgs to achieve a healthy BMI',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  flex: 1,
                ),


              ],
            ),
            flex: 4,
          ),


        ],
      ),
    );
  }





}
