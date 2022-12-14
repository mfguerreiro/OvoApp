import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ovoapp/helpers/sharedPreferences.dart';
import 'package:ovoapp/settings/routes/routeFunctions.dart';
import 'cadastro.dart';

void main() {
  runApp(const Rotas());
}

class Rotas extends StatefulWidget {
  const Rotas({Key? key}) : super(key: key);

  @override
  State<Rotas> createState() => _RotasState();
}

class _RotasState extends State<Rotas> {
  var routes = [];

  _getUsers() {
    RouteFunctions()
        .getRoutesByUser(context, SharedPreferencesUtils().getString("USER_ID"))
        .then((response) {
      setState(() {
        routes = response.data.toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width / 13);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "Rotas",
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Log()));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
