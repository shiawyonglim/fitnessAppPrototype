import 'package:flutter/material.dart';
import 'package:test/SideBar/navigation_drawer_widget.dart';
import 'package:test/contants/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Color.fromARGB(255, 250, 250, 25),
        elevation: 0,
        centerTitle: true,
      ),
      drawer: const NavigationDrawerWidget(),
      backgroundColor: mainHexcolor,
    );
  }
}
