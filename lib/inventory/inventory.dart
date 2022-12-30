import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helpers/sharedPreferences.dart';
import '../settings/products/productsFunctions.dart';


class Inventory extends StatefulWidget {
  @override
  InventoryState createState() => InventoryState();
}

enum TypeQuantity { unity, box, carton }

class InventoryState extends State<Inventory> {

  var  products=[];

  _getProductsByUser() {
    ProductFunctions()
        .getProductsByUser(
            context, SharedPreferencesUtils().getString("USER_ID"))
        .then((response) {
      setState(() {
        products = response.toList();
        print('products');
        print(products);
      });
    });
  }
  
  get child => null;
  TypeQuantity? _character = TypeQuantity.unity;
  TextEditingController dateInput = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController sellController = TextEditingController();
  TextEditingController costController = TextEditingController();
  var dropdownValue;
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    _getProductsByUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width / 13);
    
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
      body: ListView(shrinkWrap: true, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Quantidade:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                      ),
                    ),
                    SizedBox(
                      width: 125.0,
                      child: TextField(
                        controller: quantityController ,
                        keyboardType: TextInputType.numberWithOptions(),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(53.0, 0, 72, 0),
                  child: Text(
                    'Produto:',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
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
                  items: products.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value['id'],
                      child: Text(value['name']),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      'Valor de custo:',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: SizedBox(
                        width: 125.0,
                        child: TextField(
                          controller: costController,
                          keyboardType: TextInputType.numberWithOptions(),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: ('0'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      'Valor de venda:',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: SizedBox(
                        width: 125.0,
                        child: TextField(
                          controller: sellController,
                          keyboardType: TextInputType.numberWithOptions(),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: ('0'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13.0),
                      child: Text(
                        'Data de compra:',
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: SizedBox(
                        width: 125.0,
                        child: TextField(
                          controller: dateInput,
                          decoration: InputDecoration(
                            icon: Icon(Icons.calendar_today),
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              print(pickedDate);

                              String formattedDate =
                                  DateFormat('yyyy/MM/dd').format(pickedDate);
                              print(formattedDate);
                              setState(() {
                                dateInput.text = formattedDate;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                            quantityController.text='';
                            sellController.text='';
                            costController.text='';
                            dateInput.text='';
                             setState(() {
                                _character = TypeQuantity.unity;
                                print('produtos');
                                print(products[0]['id']);
                                dropdownValue = products[0]['id'];
                              });
                        },
                        child: Text(
                          'Limpar',
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                        )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:25.0),
                            child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                            'Enviar',
                            style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 43, 148, 45),
                        )),
                          ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
