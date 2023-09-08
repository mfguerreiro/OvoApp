import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ovoapp/home/home.dart';
import 'package:ovoapp/splash/splashFunctions.dart';
import 'package:ovoapp/user/user.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home: Home()));
  // SharedPreferencesUtils().init();
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<bool> _isDeviceRegistered() async {
    return await SplashFunctions().checkIfDeviceIdIsRegisteredAndCallScreen();
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return FutureBuilder(
        future: _isDeviceRegistered(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              strokeWidth: 4,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
            );
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else if (snapshot.data == true) {
            return const HomeScreen();
          } else {
            return User();
          }
        });
  }
}
