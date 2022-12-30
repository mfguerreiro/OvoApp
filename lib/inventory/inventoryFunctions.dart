import 'package:flutter/material.dart';
import 'package:ovoapp/helpers/loading_helper.dart';
import 'package:ovoapp/home/home.dart';
import 'package:ovoapp/inventory/inventory.dart';

import '../helpers/api.dart';
import '../helpers/showAlertDialog.dart';

class InventoryFuncions {
  Future registerInventory(context, quantity, costValue, saleValue,
      purchaseDate, productId, userId) async {
    print('REGISTER Inventory!!');

    Map data = {
      "quantity": quantity,
      "costValue": costValue,
      "saleValue": saleValue,
      "purchaseDate": purchaseDate,
      "productId": productId,
      "userId": userId
    };

    try {
      loading();

      var response = await Api().requestPost('/stock', data);

      dismissLoading();

      if (response['statusCode'] == 201) {
        ShowAlertDialog().showAlertDialogSuccessAndCallHome(
            context, "SUCESSO", "ESTOQUE CADASTRADO COM SUCESSO!", "OK");
      } else {
        ShowAlertDialog().showAlertDialogInformative(context, "ATENÇÃO",
            "NÃO FOI POSSÍVEL CADASTRAR O ESTOQUE!", "ENTENDI");
        //tratar erros: usuário/senha errado OU não cadastrado
      }
    } catch (e) {
      print('Erro:');
      print(e);

      dismissLoading();
    }
  }

  calculateValues(quantity, costValue, saleValue, unity) {
    switch (unity) {
      case TypeQuantity.unity:
        return {
          'quantity': quantity,
          'costValue': costValue,
          'saleValue': saleValue
        };
      case TypeQuantity.carton:
        return {
          'quantity': quantity * 30,
          'costValue': costValue / 30,
          'saleValue': saleValue / 30
        };
      case TypeQuantity.box:
        return {
          'quantity': quantity * 360,
          'costValue': costValue / 360,
          'saleValue': saleValue / 360
        };
    }
  }
}
