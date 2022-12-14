import 'package:flutter/material.dart';
import 'package:ovoapp/helpers/api.dart';
import 'package:ovoapp/settings/routes/routeFunctions.dart';

import '../../helpers/sharedPreferences.dart';

void main() {
  runApp(Log());
}

class Log extends StatefulWidget {
  Log({Key? key}) : super(key: key);

  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  String userId = SharedPreferencesUtils().getString('USER_ID');
  final TextEditingController _routeController = TextEditingController();

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
          "Cadastrar Rotas",
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
                      controller: _routeController,
                      
                      decoration: const InputDecoration(
                        labelText: 'Insira a nova rota!',
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
                  await RouteFunctions()
                      .registerRoute(context, _routeController.text, userId);
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
