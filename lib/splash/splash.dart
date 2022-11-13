import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovoapp/splash/splashFunctions.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 2000), () {
      SplashFunctions().checkIfDeviceIdIsRegisteredAndCallScreen(context);
    });
    return _introScreen(context);
  }
}

Widget _introScreen(context) {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.yellow, Colors.yellow],
        ),
        loaderColor: Colors.transparent,
      ),
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250.0,
              child: Image.asset(
                "assets/images/happyEgg.png",
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      )
    ],
  );
}
