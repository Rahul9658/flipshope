
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shoes/model/store_model.dart';
import 'package:http/http.dart'as http;
import 'package:shoes/services/app_url.dart';

class StoreProvider with ChangeNotifier{

  bool isLoading = true;
  late  StoreModel  storeModel;

  Future<void> getRpdFiltersSTORE() async{
    try{
      final response = await http.get(Uri.parse(ApiUrl.Store));
      if(response.statusCode==200){
        storeModel = StoreModel.fromJson(jsonDecode(response.body));
        print("Response Data Stor Api ****************${response.body}");
        isLoading=false;
        notifyListeners();
      }
      else {
        throw Exception('Failed to load store data');
      }
    }catch(e){
      isLoading= false;
      notifyListeners();
      throw Exception('Failed to load store data: $e');


    }

  }


}