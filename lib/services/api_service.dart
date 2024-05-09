import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pulse_play/models/location_info.dart';
class ApiService{
  final url = Uri.parse(
    "http://ip-api.com/json/?fields=status,message,continent,continentCode,country,countryCode,region,regionName,city,district,zip,lat,lon,timezone,offset,currency,isp,org,as,asname,reverse,mobile,proxy,hosting,query");
  
  Future<LocationInfo> fetchLocationData() async{
    final response = await http.get(url);

    if (response.statusCode == 200){
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      return LocationInfo.fromJson(jsonData);
    }else{
      throw Exception('Failed to load IP data: ${response.statusCode}');
    }
  }
}

