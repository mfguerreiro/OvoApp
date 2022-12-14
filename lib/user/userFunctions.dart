import 'package:flutter/material.dart';

import '../helpers/api.dart';
import '../helpers/getDeviceInfo.dart';
import '../helpers/sharedPreferences.dart';
import '../helpers/showAlertDialog.dart';
import '../home/home.dart';

class UserFunctions {
  Future registerUser(context, String name) async {
    String? deviceId = await getDeviceIdentifier();

    var response =
        await Api().requestPost('/user', {'name': name, 'deviceId': deviceId});

    if (response.statusCode == 201) {
      SharedPreferencesUtils().setString('USER_ID', response.userId);
      SharedPreferencesUtils().setString('NAME', name);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      print('Erro ao cadastrar usuario');
      print(response.toString());
      ShowAlertDialog().showAlertDialogInformative(context, "ATENÇÃO",
          "Não foi possível cadastrar o usuário, tente novamente!", "OK");
    }
  }
}
