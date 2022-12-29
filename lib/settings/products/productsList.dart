import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ovoapp/helpers/sharedPreferences.dart';
import 'package:ovoapp/settings/products/productsFunctions.dart';
import 'package:ovoapp/settings/products/registerProducts.dart';
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
  var products = [];

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

  initState() {
    super.initState();
    _getProductsByUser();
  }

  @override
  Widget build(BuildContext context) {
    final productList = Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text(products[index]['name']));
        },
      ),
    );

    final emptyProducts = Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text("(Nenhum produto cadastrado)",
                style: TextStyle(color: Colors.grey)),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "Produtos",
        ),
      ),
      body: RefreshIndicator(
          onRefresh: () {
            return _getProductsByUser();
          },
          child: products.isNotEmpty ? productList : emptyProducts),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegisterProducts()));
          // context, MaterialPageRoute(builder: (context) => Log()));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
