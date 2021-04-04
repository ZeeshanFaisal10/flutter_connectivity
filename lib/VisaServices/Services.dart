import 'package:http/http.dart 'as http;
import 'package:flutter_connectivity/ObjectClasses/FetchCountries.dart';
import 'package:flutter_connectivity/apis/api.dart';
class Services {
  //
  static Future<List<FetchCountries>> getVisaCountries() async {
    try {
      final response = await http.get(fetchVisaCountries);
      if (200 == response.statusCode) {
        final List<FetchCountries> users = fetchCountriesFromJson(response.body);
        return users;
      } else {
        return List<FetchCountries>();
      }
    } catch (e) {
      return List<FetchCountries>();
    }
  }

}

