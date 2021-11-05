import 'dart:convert';
import 'package:oniric/models/Boats.dart';
import 'package:oniric/models/Itinerary.dart';
import 'package:oniric/models/Service.dart';
import 'package:oniric/models/Cabins.dart';
import 'package:oniric/models/Availability.dart';
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
  var urlVessels = Uri.https(BASE, PATH_VESSELS);

  Future<List<Boats>> getVessels() async {
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
    var urlVesselById =
        'https://gpstest.andeantc.com/api/vessel/get-vessel-id/$vslId';
    try {
      final response = await http.get(Uri.parse(urlVesselById), headers: {
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
    var urlServicesByVessel =
        'https://gpstest.andeantc.com/api/service/get-vessel-services/$vslId';

    try {
      final response = await http.get(Uri.parse(urlServicesByVessel), headers: {
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
        // print("Datos de servicio (2) ===> ");
        // print(modelList);

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
    var urlCabinsByVessel =
        //'https://gpstest.andeantc.com/api/cabin/get-cabins-by-vessel/$vslId';
        'http://gpstest.andeantc.com/api/cabin/get-cabins-by-vessel/5'; // TODO: cambiar

    try {
      final response = await http.get(Uri.parse(urlCabinsByVessel), headers: {
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

// DISPONIBILIDAD - AVAILABILITY

  Future<List<Availability>> getAvailability(start, end) async {
    print('===================Consultando API=========================');
    print("Modificando fecha: Start: $start End: $end");
    var urlAvailability =
        //'https://gpstest.andeantc.com/api/cabin/get-cabins-by-vessel/$vslId';
        'http://gpstest.andeantc.com/api/availability/get-availability?start=$start&end=$end'; // TODO: cambiar

    try {
      final response = await http.get(Uri.parse(urlAvailability), headers: {
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
    var urlItinerary =
        'https://gpstest.andeantc.com/api/itinerary/$itiId/summary-full';
    try {
      final response = await http.get(Uri.parse(urlItinerary), headers: {
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
}
