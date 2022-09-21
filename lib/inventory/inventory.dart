import 'package:flutter/material.dart';

class Inventory extends StatefulWidget {
  @override
  InventoryState createState() => InventoryState();
}

class InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Row(
            children: const [
              Text(
                "Cadastrar estoque",
                style: TextStyle(fontSize: 27.0),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Icon(
                  Icons.store,
                  size: 34.0,
                ),
              ),
            ],
          )),
      body: const Text('Tela Estoque'),
    );
  }
}
