import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  @override
  ReportsState createState() => ReportsState();
}

class ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          centerTitle: true,
          title: const Text(
            "Relatórios",
            style: TextStyle(fontSize: 28.0),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.list_alt,
                size: 35.0,
              ),
            )
          ]),
      body: const Text('Tela Relatórios'),
    );
  }
}
