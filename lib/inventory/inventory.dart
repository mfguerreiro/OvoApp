import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ovoapp/inventory/inventoryFunctions.dart';

import '../helpers/sharedPreferences.dart';
import '../settings/products/productsFunctions.dart';

class Inventory extends StatefulWidget {
  @override
  InventoryState createState() => InventoryState();
}

enum TypeQuantity { unity, box, carton }

class InventoryState extends State<Inventory> {
  var products = [];
  var productsDropDownValues;
  var unities;

  _getProductsByUser() {
    ProductFunctions()
        .getProductsByUser(
            context, SharedPreferencesUtils().getString("USER_ID"))
        .then((response) {
      setState(() {
        products = response.toList();
        productsDropDownValues = products.isNotEmpty ? products[0]['id'] : null;

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
  @override
  void initState() {
    dateInput.text = DateFormat('yyyy/MM/dd')
        .format(DateTime.now()); //set the initial value of text field
    _getProductsByUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width );
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(53.0, 0, 36, 0),
                  child: Text(
                    'Unidade de Venda:',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                DropdownButton<String>(
                  value: unities,
                  icon: const Icon(Icons.arrow_downward,color: Colors.black,),
                  elevation: 16,
                  underline: Container(
                    height: 4,
                    width: width/100,
                    color: Colors.amber,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      unities= value!;
                    });
                  },
                  
                  items: [{"id":"box","name":"Caixa"},{"id":"carton","name":"Cartela"},{"id":"Unity","name":"Unidade"}].map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem(
                      value: value['id'],
                      child: Text(value['name']!),
                    );
                  }).toList(),
                ),
              ],
            ),
            Container(
              width: width,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(53.0, 0, 122, 0),
                  child: Text(
                    'Produto:',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
                DropdownButton<String>(
                  value: productsDropDownValues,
                  icon: const Icon(Icons.arrow_downward,color: Colors.black,),
                  elevation: 16,
                  underline: Container(
                    height: 4,
                    color: Colors.amber,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      productsDropDownValues = value!;
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
             Container(
              width: width,
              height: 20,
            ),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25,0,25,0),
                      child: const Text(
                        'Quantidade:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width/4,
                      child: TextField(
                        controller: quantityController,
                        keyboardType: const TextInputType.numberWithOptions(),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: ('0'),
                        ),
                      ),
                    ),
                    ],)
                  ],
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
                  children: [
                    const Text(
                      'Valor de custo:',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: SizedBox(
                        width: width/10,
                        child: TextField(
                          controller: costController,
                          keyboardType: const TextInputType.numberWithOptions(),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
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
                    const Text(
                      'Valor de venda:',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: SizedBox(
                        width: width/10,
                        child: TextField(
                          controller: sellController,
                          keyboardType: const TextInputType.numberWithOptions(),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
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
                    const Padding(
                      padding: EdgeInsets.only(left: 2.0),
                      child: Text(
                        'Data de compra:',
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                  ],
                ),
                
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: SizedBox(
                            
                            width: width/2.5,
                            child: TextField(
                              controller: dateInput,
                              decoration: const InputDecoration(
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
                          quantityController.text = '';
                          sellController.text = '';
                          costController.text = '';
                          dateInput.text = '';
                          setState(() {
                            _character = TypeQuantity.unity;
                            print('produtos');
                            print(products[0]['id']);
                            productsDropDownValues = products[0]['id'];
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                        ),
                        child: const Text(
                          'Limpar',
                          style: TextStyle(fontSize: 20),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: ElevatedButton(
                          onPressed: () async {
                            print('---------__> onpressed');

                            var realValues = InventoryFuncions()
                                .calculateValues(
                                    int.parse(quantityController.text),
                                    int.parse(costController.text),
                                    int.parse(sellController.text),
                                    _character);

                            print('realQuantity');
                            print(realValues['costValue']);

                            await InventoryFuncions().registerInventory(
                                context,
                                realValues['quantity'],
                                realValues['costValue'],
                                realValues['saleValue'],
                                dateInput.text,
                                productsDropDownValues,
                                SharedPreferencesUtils().getString('USER_ID'));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 43, 148, 45),
                          ),
                          child: const Text(
                            'Enviar',
                            style: TextStyle(fontSize: 20),
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
