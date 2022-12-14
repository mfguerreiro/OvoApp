import 'package:flutter/material.dart';

class Inventory extends StatefulWidget {
  @override
  InventoryState createState() => InventoryState();
}

class InventoryState extends State<Inventory> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width / 13);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Row(
            children: const [
              Text(
                "Cadastrar estoque",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: const [
                       
              
                Text(
                  'Quantidade:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                ),
              
            ],
          ),
          Row(
            children: const [
              Expanded(
                child: SizedBox(
                  width: 15.0,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: ('0'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
