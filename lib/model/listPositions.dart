import 'package:flutter_shift_a2_mapas_conec/model/position.dart';

class ListPositions {

  List<Position> positions;

  //construtor
  ListPositions({
    this.positions
  });

  //construtor nomeado
  ListPositions.fromJson(Map<String, dynamic> json)
      : positions = json['data'] == null ? null : buildListPositions(json['data']);

  //faz uma espécie de de->para transformando os elementos da lista que eram dynamic para Position
  static List<Position> buildListPositions(List<dynamic> list) =>
      list.map(
              (item) => Position.fromJson(item)
      ).toList();

}