// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'routes/rotas.dart';

class Settings extends StatefulWidget {
  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width / 13);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          centerTitle: true,
          title: const Text(
            "Configurações",
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.settings,
                size: 35.0,
              ),
            )
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 3,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.all(10.0),
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Rotas()));
                      },
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                          ),
                          Text(
                            "Rotas",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.amber, fontSize: 25),
                          ),
                        ],
                      ))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 3,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.all(10.0),
                      primary: Colors.white,
                    ),
                    onPressed: () {},
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                        ),
                        Text(
                          "Produtos",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.amber, fontSize: 25),
                        ),
                      ],
                    ))),
          ),
        ],
      ),
    );
  }
}
