import 'package:flutter/material.dart';
import 'package:pulse_play/models/location_info.dart';
import 'package:pulse_play/services/api_service.dart';

class LocationInfoScreenController extends ChangeNotifier{
  LocationInfo? locationInfo;
  final ApiService _service = ApiService();
  bool isLoading = false;
  String error = "";

  LocationInfoScreenController(){
    fetchData();
  }

  Future<void> fetchData()async{
    try {
      isLoading = !isLoading;
      locationInfo = await _service.fetchLocationData();
      isLoading = !isLoading;
      notifyListeners();
    } catch (e) {
      print('Error fetching location data: $e');
      error = e.toString();
      rethrow;
    }
  }
}