import 'package:flutter/material.dart';
import 'package:ovoapp/settings/products/productsList.dart';

import '../../helpers/api.dart';
import '../../helpers/loading_helper.dart';
import '../../helpers/showAlertDialog.dart';

class ProductFunctions {
  Future registerProduct(context, productName, userId) async {
    print('REGISTER Product!!');

    Map data = {'name': productName, 'userId': userId};

    try {
      loading();

      var response = await Api().requestPost('/product', data);

      dismissLoading();

      if (response['statusCode'] == 201) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Products()));
      } else {
        ShowAlertDialog().showAlertDialogInformative(context, "ATENÇÃO",
            "NÃO FOI POSSÍVEL CADASTRAR O PRODUTO!", "ENTENDI");
        //tratar erros: usuário/senha errado OU não cadastrado
      }
    } catch (e) {
      print('Erro:');
      print(e);

      dismissLoading();
    }
  }

  Future<dynamic> getProductsByUser(context, userId) async {
    print('get ROUTE !!');

    try {
      loading();

      var response = await Api().requestGet('/product/userId/$userId');

      print('response get productis');
      print(response);

      dismissLoading();

      if (response['statusCode'] == 200) {
        return response['data'];
      } else {
        ShowAlertDialog().showAlertDialogInformative(context, "ATENÇÃO",
            "NÃO FOI POSSÍVEL BUSCAR OS PRODUTOS!", "ENTENDI");
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
