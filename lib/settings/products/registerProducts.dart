import 'package:flutter/material.dart';
import 'package:ovoapp/helpers/api.dart';
import 'package:ovoapp/settings/products/productsFunctions.dart';
import 'package:ovoapp/settings/routes/routeFunctions.dart';

import '../../helpers/sharedPreferences.dart';

void main() {
  runApp(RegisterProducts());
}

class RegisterProducts extends StatefulWidget {
  RegisterProducts({Key? key}) : super(key: key);

  State<RegisterProducts> createState() => _RegisterProductsState();
}

class _RegisterProductsState extends State<RegisterProducts> {
  String userId = SharedPreferencesUtils().getString('USER_ID');
  final TextEditingController _productsController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width / 13);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "Cadastrar Produtos",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _productsController,
                      decoration: const InputDecoration(
                        labelText: 'Insira o novo produto!',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 20),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () async {
                  await ProductFunctions().registerProduct(
                      context, _productsController.text, userId);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  primary: Colors.green,
                  padding: const EdgeInsets.fromLTRB(20, 9, 20, 9),
                ),
                child: const Text('Salvar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
