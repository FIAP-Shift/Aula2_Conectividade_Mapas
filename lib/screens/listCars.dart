import 'package:flutter/material.dart';
import 'package:flutter_shift_a2_mapas_conec/model/listPositions.dart';
import 'package:flutter_shift_a2_mapas_conec/model/position.dart';
import 'package:flutter_shift_a2_mapas_conec/service/endpoints.dart';
import 'package:flutter_shift_a2_mapas_conec/widgets/listItem.dart';

class ListCars extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ListCarsState();

}

class _ListCarsState extends State<ListCars> {

  ListPositions listPositions;

  //initState faz parte do ciclo de vida do State
  //e nesse ciclo de vida, ele é a primeira chamada
  @override
  void initState() {
    super.initState();

    getPositions().then((list) {
      setState(() {
        listPositions = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        actions: [
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {
              //usando passagem de parâmetros via argumentos
              Navigator.pushNamed(
                  context,
                  "/mapa",
                  arguments: listPositions);
            },
          ),
        ],

      ),
      body: listPositions == null ? LinearProgressIndicator() :
      ListView.separated(
          itemCount: listPositions.positions.length,
          itemBuilder: (context, index) =>
              buildListItem(listPositions.positions[index]),
          separatorBuilder: (context, index) => Divider(
            height: 1,
          ),
      ),
    );
  }

  Widget buildListItem(Position position){
    return ListItemCar(position);
  }

}
