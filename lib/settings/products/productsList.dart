import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ovoapp/helpers/sharedPreferences.dart';
import 'package:ovoapp/settings/products/registerproducts.dart';
import 'package:ovoapp/settings/routes/routeFunctions.dart';

import '../routes/cadastro.dart';


void main() {
  runApp(const Products());
}

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var routes = [];

  // _getUsers() {
  //   RouteFunctions()
  //       .getRoutesByUser(context, SharedPreferencesUtils().getString("USER_ID"))
  //       .then((response) {
  //     setState(() {
  //       routes = response.data.toList();
  //     });
  //   });
  // }

  // initState() {
  //   super.initState();
  //   _getUsers();
  // }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width / 13);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "Produtos",
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text(routes[index].name));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push( context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterProducts()));
              // context, MaterialPageRoute(builder: (context) => Log()));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
