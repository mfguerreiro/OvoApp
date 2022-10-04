

import 'package:flutter/material.dart';
import '../sales/sales.dart';
import '../inventory/inventory.dart';
import '../reports/reports.dart';
import '../settings/settings.dart';



class BuildButtonsHome extends StatefulWidget {
  const BuildButtonsHome({Key? key}) : super(key: key);

  @override
  BuildButtonsHomeState createState() => BuildButtonsHomeState();
}

class BuildButtonsHomeState extends State<BuildButtonsHome> {
  @override
  Widget build(BuildContext context) {
    var height = (MediaQuery.of(context).size.height / 2);
    var width = (MediaQuery.of(context).size.width / 2);
    return SizedBox(
      
      child: Column(
       
   
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(                //botão cadastrar vendas
                  padding: const EdgeInsets.fromLTRB(10.0, 70.0, 10.0, 10.0),
                  child: SizedBox(                    
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 5,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            padding: const EdgeInsets.all(10.0),
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Sales()));
                          },
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 5.0),
                                child: Icon(
                                  Icons.request_page_outlined,
                                  color: Colors.amber,
                                  size: 70.0,
                                ),
                              ),
                              Text(
                                "Vendas",
                                textAlign: TextAlign.center,
                                style:TextStyle(color: Colors.amber, fontSize:12),
                              ),
                            ],
                          ))),
                ),
                Padding(
                  // botão cadastrar estoque
                  padding: const EdgeInsets.fromLTRB(10.0, 70.0, 10.0, 10.0),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 5,
                      child: ElevatedButton(
                     
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            padding: const EdgeInsets.all(10.0),
                            primary: Colors.white,
                          ),
                               onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Inventory()));
                          },
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 5.0),
                                child: Icon(
                                  Icons.store,
                                  color: Colors.amber,
                                  size: 70.0,
                                ),
                              ),
                              Text(
                                "Estoque",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.amber),
                              ),
                            ],
                          ))),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  //botão relatórios
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 5,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            padding: const EdgeInsets.all(10.0),
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Reports()));
                          },
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 5.0),
                                child: Icon(
                                  Icons.list_alt,
                                  color: Colors.amber,
                                  size: 70.0,
                                ),
                              ),
                              Text(
                                "Relatórios",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.amber),
                              ),
                            ],
                          ))),
                ),
                Padding(
                  //botão configurações
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                  child: SizedBox(          
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 5,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            primary: Colors.white,
                            padding: const EdgeInsets.all(10.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Settings()));
                          },
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 5.0),
                                child: Icon(
                                  Icons.settings,
                                  color: Colors.amber,
                                  size: 70.0,
                                ),
                              ),
                              Text(
                                "Configurações",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.amber),
                              ),
                            ],
                          ))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
