import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'helpers/sharedPreferences.dart';
import 'home/home.dart';
import 'splash/splash.dart';

void main() {
  runApp(MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home: Home()));
  SharedPreferencesUtils().init();
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Splash());
  }
}
