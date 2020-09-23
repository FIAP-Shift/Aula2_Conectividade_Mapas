import 'package:flutter/material.dart';
import 'package:flutter_shift_a2_mapas_conec/model/position.dart';
import 'package:geolocator/geolocator.dart' as Geolocator; //alias

class ListItemCar extends StatefulWidget {

  final Position position;

  ListItemCar(this.position);

  @override
  _ListItemCarState createState() => _ListItemCarState();
}

class _ListItemCarState extends State<ListItemCar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
