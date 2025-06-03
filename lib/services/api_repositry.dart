// lib/api/api_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoes/constant/const_screen.dart';
import 'package:shoes/model/store_model.dart' show StoreModel;
import 'app_url.dart';


class ApiRepositry {
  Future<StoreModel> getRpdFiltersSTORE() async {
    try {
      final response = await http.get(Uri.parse(ApiUrl.Store));
      if (response.statusCode == 200) {
        final StoreModel storeModel = StoreModel.fromJson(jsonDecode(response.body));
        printDebug("Response Data Store API: ${response.body}");

        return storeModel;
      } else {
        throw Exception('Failed to load store data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load store data: $e');
    }
  }
}