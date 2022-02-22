import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/SideBar/navigation_drawer_widget.dart';
import 'package:test/page/HomePage.dart';
import 'package:test/page/gender.dart';
Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const Myapp());
}

class Myapp extends StatelessWidget{
  const Myapp({Key? key}) : super(key: key);
  @override 
  Widget build(BuildContext context)=> MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    theme: ThemeData(primarySwatch: Colors.blue),
  );
  static const String title = 'BMI Calculator';
}


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          
        ),
      );
}

