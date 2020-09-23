import 'package:dio/dio.dart';
import 'package:flutter_shift_a2_mapas_conec/model/listPositions.dart';

Future<ListPositions> getPositions() async{
  BaseOptions options = new BaseOptions(
    baseUrl: "https://run.mocky.io/v3/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = Dio(options);

  ListPositions positions;
  try {
    //aos nove métodos do protocolo http
    Response response = await dio.get('b784ae68-e3f8-4306-aa1d-2a33e3acfa35');

    if (response.statusCode == 200) {
      var jsonResponse = response.data;
      if (jsonResponse["success"]) {
        positions = ListPositions.fromJson(jsonResponse);
      }
    }
  } finally {
    dio.close();
  }

  return positions;
}