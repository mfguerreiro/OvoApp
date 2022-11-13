import 'package:flutter/material.dart';
import 'package:ovoapp/helpers/loading_helper.dart';
import 'package:ovoapp/user/userFunctions.dart';

class User extends StatefulWidget {
  @override
  UserState createState() => UserState();
}

class UserState extends State<User> {
  TextEditingController _userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Row(
            children: const [
              Text(
                "Cadastrar usuário",
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Icon(
                  Icons.person_add_alt,
                  size: 34.0,
                ),
              ),
            ],
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Digite seu nome para iniciar",
            style: TextStyle(color: Colors.amber, fontSize: 20.0),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _userController,
                        decoration: const InputDecoration(
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 20),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    loading();
                    UserFunctions().registerUser(context, _userController.text);
                    dismissLoading();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.fromLTRB(20, 9, 20, 9),
                  ),
                  child: const Text('Salvar'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
