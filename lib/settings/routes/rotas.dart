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

  Future<void> _getUsers() async {
    RouteFunctions()
        .getRoutesByUser(context, SharedPreferencesUtils().getString("USER_ID"))
        .then((response) {
      setState(() {
        routes = response.toList();

        print('print routes');
        print(routes);
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    final routeList = Scaffold(
      body: ListView.builder(
        itemCount: routes.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text(routes[index]['name']));
        },
      ),
    );

    final emptyRoutes = Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text("(Nenhuma rota cadastrada)",
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
          "Rotas",
        ),
      ),
      body: RefreshIndicator(
          onRefresh: () {
            return _getUsers();
          },
          child: routes.isNotEmpty ? routeList : emptyRoutes),
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
