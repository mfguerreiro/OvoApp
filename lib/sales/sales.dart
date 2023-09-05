import 'dart:html';

import 'package:flutter/material.dart';

class Sales extends StatefulWidget {
  @override
  SalesState createState() => SalesState();
}

class SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width / 13);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Row(
              children: const [
                Text(
                  "Cadastrar vendas",          
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Icon(
                    Icons.request_page_outlined,
                    size: 35.0,
                  ),
                ),
              ],
            )),
        body: SingleChildScrollView(
            child: Column(children: const <Widget>[Text('Cadastrar Vendas')])));
  }
}

SingleChildScrollView({required child}) {
}
