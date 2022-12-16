import 'package:flutter/material.dart';

import '../helpers/api.dart';
import '../helpers/getDeviceInfo.dart';
import '../helpers/loading_helper.dart';
import '../helpers/sharedPreferences.dart';
import '../helpers/showAlertDialog.dart';
import '../home/home.dart';

class UserFunctions {
  Future registerUser(context, String name) async {
    String? deviceId = await getDeviceIdentifier();

    try {
      loading();

      var response = await Api()
          .requestPost('/user', {'name': name, 'deviceId': deviceId});

      dismissLoading();

      print('response');
      print(response);

      if (response['statusCode'] == 201) {
        SharedPreferencesUtils().setString('USER_ID', response['id']);
        SharedPreferencesUtils().setString('NAME', name);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        print('Erro ao cadastrar usuario');
        print(response.toString());
        ShowAlertDialog().showAlertDialogInformative(context, "ATENÇÃO",
            "Não foi possível cadastrar o usuário, tente novamente!", "OK");
      }
    } catch (e) {
      print('Erro:');
      print(e);
      dismissLoading();
    }
  }
}
