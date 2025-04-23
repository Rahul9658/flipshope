
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shoes/model/store_model.dart';
import 'package:http/http.dart'as http;
import 'package:shoes/services/app_url.dart';

import '../model/deals_model.dart';
import '../model/recint_price.dart';

class StoreProvider with ChangeNotifier{

  bool isLoading = true;
  late  StoreModel  storeModel;
  late Datamodel  datamodel;
  late recientPriceDropModel recientPriceModel;

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

  Future <void> getDealsData() async{
    try{
      final response = await http.get(Uri.parse(ApiUrl.lootDeals));
      if(response.statusCode==200){
        datamodel =Datamodel.fromJson(jsonDecode(response.body));
        print("Response Data Deals Api ****************${response.body}");
        isLoading=false;
        notifyListeners();
      }else {
        throw Exception('Failed to load store data');
      }

     }catch(e){
      isLoading= false;
      notifyListeners();
      throw Exception('Failed to load store data: $e');

    }

  }
  Future<void> recientPriceDrop()async{
    try{
      final response = await http.post(Uri.parse(ApiUrl.recientPrice));
       if(response.statusCode==200){
         recientPriceModel = recientPriceDropModel.fromJson(jsonDecode(response.body));
         print("Response Recent price Model**************${response.body}");
         isLoading=false;
         notifyListeners();

       }
       else{
         throw Exception("Failed to price data");
       }

    }catch(e){
      isLoading=false;
      notifyListeners();
      throw Exception('Failed to load store data: $e');


    }


  }


  Future<void> mobileSignUp(String phone) async {
    try {
      Map<String, dynamic> params = {"mobile": phone};

      final response = await http.post(
        Uri.parse("https://flipshope.com/api/user/auth/sendmobotp"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(params),
      );

      if (response.statusCode == 200) {
        print("OTP sent successfully: ${response.body}");
      } else {
        print("Failed to send OTP: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Error sending OTP: $e");
    }
  }




}