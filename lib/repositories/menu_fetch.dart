import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_web_app/models/category_model.dart';
import 'package:restaurant_web_app/models/response_model.dart';

class MenuFetchRepository {
  final String baseURL = "http://20.219.220.200/api/v1";
  final tableId = "84380b11f1474038a6e652c5c0d48d32";
  // c480d23a11b94c4599500bb04a4c7fbf

  Future<List<Categories>> fetchOnboardingData() async {
    final response =
        await http.get(Uri.parse('$baseURL/getAllDataDishes/$tableId'));
    if (response.statusCode == 200) {
      print('Connection Success');
      return ResponseModel.fromJson(json.decode(response.body))
          .data!
          .categories!;
    } else {
      print('Connection Error');
      throw Exception('Failed to load data');
    }
  }
}
