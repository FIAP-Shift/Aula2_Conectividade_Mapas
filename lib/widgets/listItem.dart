import 'package:flutter/material.dart';
import 'package:flutter_shift_a2_mapas_conec/model/position.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geolocator/geolocator.dart' as Geolocator; //alias

class ListItemCar extends StatefulWidget {

  final Position position;

  ListItemCar(this.position);

  @override
  _ListItemCarState createState() => _ListItemCarState();
}

class _ListItemCarState extends State<ListItemCar> {

  TextStyle style15dp = TextStyle(fontSize: 15);
  TextStyle style27dp = TextStyle(fontSize: 27);

  //encapsula os dados do endereço
  Geolocator.Placemark placemark;

  //ciclo de vida do State
  @override
  void initState() {
    super.initState();
    getAddress();
  }

  getAddress() async {
    List<Geolocator.Placemark> listPlacemarks =
      await Geolocator.Geolocator().placemarkFromCoordinates(
          widget.position.lat,
          widget.position.lng);

    //se fosse um app profissional, alguma lógica deveria ser feita
    //para saber qual índice seria o mais adequado
    setState(() {
      placemark = listPlacemarks[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      // corpo do item
      child: buildChildSlidable(),
      //ações escondidas quando tem swipe da esquerda pra direita
      actions: <Widget>[],
      //ações escondidas quando tem swipe da direita pra esquerda
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Comandos',
          color: Colors.lightBlue,
          foregroundColor: Colors.white,
          icon: Icons.archive,
          onTap: () {
            showBottomSheet();
          },
        ),
      ],
    );
  }

  void showBottomSheet(){
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.headset_off)),
                      Text("Desliga alto-falantes")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.highlight),
                      ),
                      Text("Ligar farol de milha")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.power_settings_new),
                      ),
                      Text("Liga/Desliga contato")
                    ],
                  ),
                )
              ],
            )
          );
    });
  }

  Widget buildChildSlidable() => InkWell(
    child: Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    widget.position.veiculo_placa.trim(),
                    style: style27dp
                ),
                Text(
                    widget.position.condutor_nome == null ? "-" : widget.position.condutor_nome,
                    style: style15dp
                ),
                Text(
                  placemark == null ?
                  "Buscando endereço..." : getFormattedAddress(),
                  style: style15dp,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
    ),
    onTap: (){
      Navigator.pushNamed(context, "/mapa", arguments: widget.position);
    },
  );

  String getFormattedAddress(){
    return "${placemark.subAdministrativeArea}, ${placemark.administrativeArea}";
  }

}
