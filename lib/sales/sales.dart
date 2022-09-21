import 'package:flutter/material.dart';

class Sales extends StatefulWidget {
  @override
  SalesState createState() => SalesState();
}

class SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Row(
              children: const [
                Text(
                  "Cadastrar vendas",
                  style: TextStyle(fontSize: 28.0),
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
