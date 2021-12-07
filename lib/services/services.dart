import 'dart:convert';
import 'package:oniric/models/Boats.dart';
import 'package:oniric/models/Images.dart';
import 'package:oniric/models/Itinerary.dart';
import 'package:oniric/models/Metadata.dart';
import 'package:oniric/models/Service.dart';
import 'package:oniric/models/Cabins.dart';
import 'package:oniric/models/Availability.dart';
import 'package:oniric/models/Mail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../conf/configuration.dart';

// investigar

// var uri = Uri(
//   scheme: 'https',
//   host: 'example.com',
//   path: '/foo/bar',
//   fragment: 'baz',
//   queryParameters: _yourQueryParameters,
// );

//var response = await http.get(uri);

class Services {
  //var urlVessels = Uri.https(BASE, PATH_VESSELS);
  //var urlVessels = 'http://10.0.2.2:8000/api/vessel/getAll';

  Future<List<Boats>> getVessels() async {
    var urlVessels = Uri.https(BASE, PATH_VESSELS);
    try {
      final response = await http.get(urlVessels, headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      });
      final Map<String, dynamic> decodeData = json.decode(response.body);
      final List<Boats> modelList = [];
      if (response.statusCode == 200) {
        for (var item in decodeData['data']) {
          final model = new Boats.fromJson(item);
          modelList.add(model);
        }
        return modelList;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      print("Error en api: " + e.toString());
      rethrow;
    }
  }

  Future<Boats> getBoatInfo(vslId) async {
    var urlVesselById = Uri.https(BASE, PATH_GET_VESSEL_INFO + '${vslId}');
    try {
      final response = await http.get(urlVesselById, headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      });

      if (response.statusCode == 200) {
        var parsedJson = json.decode(response.body);
        //print(parsedJson['data']);
        return Boats.fromJson(parsedJson['data']);
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

// SERVICIOS

  Future<List<Service>> getServicesByVslId(vslId) async {
    var url = Uri.https(BASE, PATH_GET_VESSEL_SERVICES + '${vslId}');
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      });

      final Map<String, dynamic> decodeData = json.decode(response.body);
      final List<Service> modelList = [];
      if (response.statusCode == 200) {
        for (var item in decodeData['data']) {
          final model = new Service.fromJson(item);
          modelList.add(model);
        }
        return modelList;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      print("Error en api: " + e.toString());
      rethrow;
    }
  }

// CABINS y DECKS

  Future<List<Cabins>> getCabinsByVslId(vslId) async {
    var url = Uri.https(BASE, PATH_GET_CABINS_BY_VESSEL + '${vslId}');
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      });

      final Map<String, dynamic> decodeData = json.decode(response.body);
      final List<Cabins> modelList = [];
      if (response.statusCode == 200) {
        for (var item in decodeData['data']) {
          final model = new Cabins.fromJson(item);
          modelList.add(model);
        }
        return modelList;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      print("Error en api: " + e.toString());
      rethrow;
    }
  }

  Future<List<Metadata>> getCatalogo(group) async {
    var url = Uri.https(BASE, PATH_CATALOGO + '${group}');
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      });

      final Map<String, dynamic> decodeData = json.decode(response.body);
      final List<Metadata> modelList = [];
      if (response.statusCode == 200) {
        for (var item in decodeData['data']) {
          final model = new Metadata.fromJson(item);
          modelList.add(model);
        }
        print("API $modelList");
        return modelList;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      print("Error en api: " + e.toString());
      rethrow;
    }
  }

// DISPONIBILIDAD - AVAILABILITY

  Future<List<Availability>> getAvailability(start, end) async {
    var url = Uri(
      scheme: 'https',
      host: BASE,
      path: PATH_AVAILABILITY,
      queryParameters: {
        'start': start,
        'end': end,
      },
    );

    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      });

      final Map<String, dynamic> decodeData = json.decode(response.body);
      final List<Availability> modelList = [];
      if (response.statusCode == 200) {
        for (var item in decodeData['data']['data']) {
          final model = new Availability.fromJson(item);
          modelList.add(model);
        }
        return modelList;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      print("Error en getAvailability: " + e.toString());
      rethrow;
    }
  }

  //ITINERARIOS:

  Future<Itinerary> getItinerariesByItiId(itiId) async {
    var url = Uri.https(BASE, PATH_ITINERARY + '${itiId}/summary-full');
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      });
      if (response.statusCode == 200) {
        var parsedJson = json.decode(response.body);
        return Itinerary.fromJson(parsedJson['data']);
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  //ENVIO DE CORREO DESDE FORMULARIO DE CONTACTO:

  Future<Mail> sendMailApp(data) async {
    var url = Uri.https(BASE_MAIL, PATH_MAIL);
    Map<String, String> headers = {
      // 'Content-Type': 'application/json;charset=UTF-8',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Charset': 'utf-8',
      "Accept": "application/json"
    };
    var encoding = Encoding.getByName("utf-8");

    final response = await http.post(url, headers: headers, body: data);
    if (response.statusCode == 200) {
      return Mail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<List<Images>> getImagesFromVslId(vslId) async {
    var url = Uri.https(BASE, PATH_IMAGES + '${vslId}');
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      });

      final Map<String, dynamic> decodeData = json.decode(response.body);
      final List<Images> modelList = [];
      if (response.statusCode == 200) {
        for (var item in decodeData['data']) {
          final model = new Images.fromJson(item);
          modelList.add(model);
        }
        return modelList;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      print("Error en api: " + e.toString());
      rethrow;
    }
  }
}
