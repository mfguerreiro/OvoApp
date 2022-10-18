import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            color: Colors.red,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.black,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.green,
            width: 50,
            height: 50,
          ),
        ],
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
