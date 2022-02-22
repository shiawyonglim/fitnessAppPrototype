import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/contants/app_constants.dart';
import 'package:test/Contrast/leftbar.dart';
import 'package:test/Contrast/right_bar.dart';
import 'package:test/SideBar/navigation_drawer_widget.dart';

class BMIcal extends StatefulWidget{
  const BMIcal({Key? key}) : super(key: key);

  @override 
  _BMIcalState createState() => _BMIcalState();
}

class _BMIcalState extends State<BMIcal>{
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiresult = 0;
  String _textresult = "";
  @override  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:  const Text('BMI calculator'),
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
            child: TextField(controller: _heightController, style: TextStyle(fontSize: 42 ,fontWeight: FontWeight.w300,color: accentHexcolor),
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
        ],),
         const SizedBox(height: 30,),
        GestureDetector(
          onTap: (){
            double _h = double.parse(_heightController.text);
            double _w = double.parse(_weightController.text);
            setState(() {
              _bmiresult = _w / (_h*_h);
              if(_bmiresult < 15.999){
                _textresult = "You are very thin";
              }
              else if (_bmiresult >= 16 && _bmiresult <= 16.999){
                _textresult = "you are a little too thin";
              }
              else if (_bmiresult >= 17 && _bmiresult <= 18.499){
                _textresult = "You are a little thin";
              }
               else if (_bmiresult >= 18.5 && _bmiresult <= 24.999){
                _textresult = "You are normal weight";
              } 
              else if (_bmiresult >= 25 && _bmiresult <= 29.999){
                _textresult = "You are obese class 1";
              }
              else if(_bmiresult >=30 && _bmiresult <=39.999){
                _textresult = "you are obese class 2";
              }
              else{
                _textresult = "You are obese class 3";
              }
            });

          },
          child: Text("Calculate",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: accentHexcolor),),
        ),
        const SizedBox(height: 50,),
        Text(_bmiresult.toStringAsFixed(2),style: TextStyle(fontSize: 50,color: accentHexcolor),),
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