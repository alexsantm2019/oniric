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
    // try {
    //   final response = await http.get(Uri.parse(urlVessels), headers: {
    //     'Content-Type': 'application/json;charset=UTF-8',
    //     'Charset': 'utf-8'
    //   });
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
        //    'https://gpstest.andeantc.com/api/cabin/get-cabins-by-vessel/$vslId';
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

  Future<List<Metadata>> getCatalogo(group) async {
    var url =
        'https://gpstest.andeantc.com/api/metadata/getMetadataByGroup/$group';

    try {
      final response = await http.get(Uri.parse(url), headers: {
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

  //ENVIO DE CORREO DESDE FORMULARIO DE CONTACTO:

  Future<Mail> sendMailApp(data) async {
    //var url = 'https://profiles.andeantc.com/api/mail/sendMailApp';
    var url = 'http://10.0.2.2:8000/api/mail/sendMailApp';
    Map<String, String> headers = {
      // 'Content-Type': 'application/json;charset=UTF-8',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Charset': 'utf-8',
      "Accept": "application/json"
    };
    var encoding = Encoding.getByName("utf-8");

    final response =
        await http.post(Uri.parse(url), headers: headers, body: data);
    if (response.statusCode == 200) {
      return Mail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<List<Images>> getImagesFromVslId(vslId) async {
    var url = 'http://10.0.2.2:8000/api/filebox/getImagesFromVslId/$vslId';

    try {
      final response = await http.get(Uri.parse(url), headers: {
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
