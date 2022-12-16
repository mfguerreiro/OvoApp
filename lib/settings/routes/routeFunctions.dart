import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ovoapp/settings/routes/rotas.dart';

import '../../helpers/api.dart';
import '../../helpers/loading_helper.dart';
import '../../helpers/showAlertDialog.dart';

class RouteFunctions {
  Future registerRoute(context, routeName, userId) async {
    print('REGISTER ROUTE!!');

    Map data = {'name': routeName, 'userId': userId};

    try {
      loading();

      var response = await Api().requestPost('/route', data);

      dismissLoading();

      if (response['statusCode'] == 201) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Rotas()));
      } else {
        ShowAlertDialog().showAlertDialogInformative(context, "ATENÇÃO",
            "NÃO FOI POSSÍVEL CADASTRAR A ROTA!", "ENTENDI");
        //tratar erros: usuário/senha errado OU não cadastrado
      }
    } catch (e) {
      print('Erro:');
      print(e);

      dismissLoading();
    }
  }

  Future<dynamic> getRoutesByUser(context, userId) async {
    print('get ROUTE !!');

    try {
      loading();

      var response = await Api().requestGet('/route/userId/$userId');

      print('response get routes');
      print(response);

      dismissLoading();

      if (response['statusCode'] == 200) {
        return response['data'];
      } else {
        ShowAlertDialog().showAlertDialogInformative(
            context, "ATENÇÃO", "NÃO FOI POSSÍVEL BUSCAR AS ROTAS!", "ENTENDI");
        //tratar erros: usuário/senha errado OU não cadastrado
      }
    } catch (e) {
      print('Erro:');
      print(e);

      dismissLoading();
      throw e;
    }
  }
}
