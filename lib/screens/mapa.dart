import 'package:flutter/material.dart';
import 'package:flutter_shift_a2_mapas_conec/model/listPositions.dart';
import 'package:flutter_shift_a2_mapas_conec/model/position.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  Position position;
  ListPositions listPositions;

  CameraPosition _position;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  }

}
