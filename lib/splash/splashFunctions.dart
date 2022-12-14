import 'package:flutter/material.dart';
import '../helpers/api.dart';
import '../helpers/getDeviceInfo.dart';
import '../helpers/sharedPreferences.dart';
import '../home/home.dart';
import '../user/user.dart';

class SplashFunctions {
  Future checkIfDeviceIdIsRegisteredAndCallScreen(context) async {
    print('checkIfDeviceIdIsRegisteredAndCallScreen: ');

    String? deviceId = await getDeviceIdentifier();

    var response = await Api().requestGet('/user/deviceId/$deviceId');

    print('RESPONSE SPLASH');
    print(response);

    if (response['statusCode'] == 200) {
      if (response['data'] != null) {
        SharedPreferencesUtils().setString('USER_ID', response['data']['id']);
        SharedPreferencesUtils().setString('NAME', response['data']['name']);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => User()));
      }
    } else {
      print('Erro ao buscar deviceId');
      print(response.toString());
      //tratar erros: usuário/senha errado OU não cadastrado
    }
  }
}
