import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/contants/app_constants.dart';
import 'package:test/Contrast/leftbar.dart';
import 'package:test/Contrast/right_bar.dart';
import 'package:test/SideBar/navigation_drawer_widget.dart';

class BFcal extends StatefulWidget{
  const BFcal({Key? key}) : super(key: key);

  @override 
  _BFcalState createState() => _BFcalState();
}

class _BFcalState extends State<BFcal>{
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _neckController = TextEditingController();
  final TextEditingController _waistController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();


  double _bmicresult = 0;
  double _bfresult = 0;
  String _textresult = "";
  @override  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Body Fat Calculator'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      drawer: const NavigationDrawerWidget(),
      backgroundColor: mainHexcolor,
      body: SingleChildScrollView(child: Column(children:[
        const SizedBox(height: 20,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 130,
            child: TextField(
              controller: _heightController, 
              style: TextStyle(fontSize: 42 ,
              fontWeight: FontWeight.w300,
              color: accentHexcolor
              ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Height(m)",
              hintStyle: TextStyle(fontSize: 26, 
                fontWeight: 
                FontWeight.w300,
                color: Colors.white.withOpacity(.8)
              ),
            ),
            ),
          ),
          SizedBox(
            width: 130,
            child: TextField(controller: _weightController, style: TextStyle(fontSize: 42 ,fontWeight: FontWeight.w300,color: accentHexcolor),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Weight(KG)",
              hintStyle: TextStyle(fontSize: 26, 
                fontWeight: 
                FontWeight.w300,
                color: Colors.white.withOpacity(.8)
              ),
            ),
            ),
          ),
        ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           SizedBox(
            width: 130,
            child: TextField(controller: _waistController, style: TextStyle(fontSize: 42 ,fontWeight: FontWeight.w300,color: accentHexcolor),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Waist(m)",
              hintStyle: TextStyle(fontSize: 26, 
                fontWeight: 
                FontWeight.w300,
                color: Colors.white.withOpacity(.8)
              ),
            ),
            ),
          ),
           SizedBox(
            width: 130,
            child: TextField(controller: _neckController, style: TextStyle(fontSize: 42 ,fontWeight: FontWeight.w300,color: accentHexcolor),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Neck(m)",
              hintStyle: TextStyle(fontSize: 26, 
                fontWeight: 
                FontWeight.w300,
                color: Colors.white.withOpacity(.8)
              ),
            ),
            ),
          ),
        ],
        ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
           SizedBox(
            width: 130,
            child: TextField(
              controller: _ageController, 
              style: TextStyle(fontSize: 42 ,
              fontWeight: FontWeight.w300,
              color: accentHexcolor, 
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Age",
              hintStyle: TextStyle(fontSize: 26, 
                fontWeight: 
                FontWeight.w300,
                color: Colors.white.withOpacity(.8)
              ),
            ),
            ),
          ),
        ],
        ),
         const SizedBox(height: 30,),
        GestureDetector(
          onTap: (){
            double _height = double.parse(_heightController.text);
            double _weight = double.parse(_weightController.text);
            double _waist = double.parse(_waistController.text);
            double _neck = double.parse(_neckController.text);
            double _age = double.parse(_ageController.text);
            setState(() {
              _bmicresult = _weight / (_height*_height);
              _bfresult = 10.1 - 0.239*_height +0.8*_waist - 0.5*_neck;
              //_bfresult = -44.988 + (0.503 * _age) + (10.689 * gender) + (3.172 * _bmicresult) - (0.026 * _bmicresult*_bmicresult) + (0.181 * _bmicresult * gender) - (0.02 * _bmicresult * _age) - (0.005 * _bmicresult*_bmicresult* gender) + (0.00021 * _bmicresult * age);
              if(_bmicresult < 15.999){
                _textresult = "You are very thin";
              }
              else if (_bmicresult >= 16 && _bmicresult <= 16.999){
                _textresult = "you are a little too thin";
              }
              else if (_bmicresult >= 17 && _bmicresult <= 18.499){
                _textresult = "You are a little thin";
              }
               else if (_bmicresult >= 18.5 && _bmicresult <= 24.999){
                _textresult = "You are normal weight";
              } 
              else if (_bmicresult >= 25 && _bmicresult <= 29.999){
                _textresult = "You are obese class 1";
              }
              else{
                _textresult = "You are obese class 3";
              }
            });

          },
          child: Text("Calculate",style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: accentHexcolor),),
        ),
        const SizedBox(height: 50,),
        Text(_bfresult.toStringAsFixed(2),style: TextStyle(fontSize: 50,color: accentHexcolor),),
        const SizedBox(height: 30,),
        Visibility(visible:_textresult.isNotEmpty,child: Text(_textresult, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400,color: accentHexcolor),),),
        const SizedBox(height: 40,),
        const LeftBar(barWidth: 40,),
        const SizedBox(height: 20,),
        const LeftBar(barWidth: 70,),
        const SizedBox(height: 20,),
        const LeftBar(barWidth: 40,),
        const SizedBox(height: 20,),
        const RightBar(barWidth: 70),
        const SizedBox(height: 50,),
        const RightBar(barWidth: 70),

      ],),),
    );
  }
}

