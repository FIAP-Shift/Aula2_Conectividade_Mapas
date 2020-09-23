import 'package:flutter/material.dart';
import 'package:flutter_shift_a2_mapas_conec/screens/listCars.dart';
import 'package:flutter_shift_a2_mapas_conec/screens/mapa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => ListCars(),
        "/mapa": (context) => Mapa()
      }
    );
  }
}
