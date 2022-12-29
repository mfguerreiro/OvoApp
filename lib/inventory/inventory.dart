import 'package:flutter/material.dart';

const List<String> list = <String>[
  'Branco',
  'Vermelho',
  'Codorna',
];

class Inventory extends StatefulWidget {
  @override
  InventoryState createState() => InventoryState();
}

enum TypeQuantity { unity, box, carton }

class InventoryState extends State<Inventory> {
  get child => null;
  TypeQuantity? _character = TypeQuantity.unity;

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width / 13);
    String dropdownValue = list.first;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text(
                    'Quantidade:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(
                    width: 125.0,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: ('0'),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: 170,
                    child: ListTile(
                      title: const Text('Unidade'),
                      leading: Radio<TypeQuantity>(
                          value: TypeQuantity.unity,
                          groupValue: _character,
                          onChanged: (TypeQuantity? value) {
                            setState(() {
                              _character = value;
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: ListTile(
                      title: const Text('Cartela'),
                      leading: Radio<TypeQuantity>(
                          value: TypeQuantity.carton,
                          groupValue: _character,
                          onChanged: (TypeQuantity? value) {
                            setState(() {
                              _character = value;
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: ListTile(
                      title: const Text('Caixa'),
                      leading: Radio<TypeQuantity>(
                          value: TypeQuantity.box,
                          groupValue: _character,
                          onChanged: (TypeQuantity? value) {
                            setState(() {
                              _character = value;
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            const Text(
                  'Produto:',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              
             
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  
                  underline: Container(
                    height: 4,
                    color: Colors.amber,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              
            ],
          )
        ],
      ),
    );
  }
}
