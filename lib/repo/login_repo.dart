import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shoes/constant/const_screen.dart';
import 'package:shoes/model/login_model.dart' show LoginModelApi;
import 'package:shoes/services/app_url.dart' show ApiUrl, Helpers, getAuthHeader;


Future<LoginModelApi> loginRepo(
    { email, context,password}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['email'] = email;
  map['password'] = password;
  printDebug(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrl.loginAuth),
      headers: await getAuthHeader(context), body: jsonEncode(map));
  printDebug("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return LoginModelApi.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return LoginModelApi(
      message: jsonDecode(response.body)["message"],
    );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}
