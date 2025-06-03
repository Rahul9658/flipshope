import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/login_model.dart';
import '../services/app_url.dart';



Future<LoginModelApi> updateProfileRepo({
  required BuildContext context,
  required String name,
  required String email,
  required String phone,
  required String age,
  required File imageFile,
}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var uri = Uri.parse(ApiUrl.updateProfile);
  var request = http.MultipartRequest('POST', uri);
  final headers = await getAuthHeader(context);
  request.headers.addAll(headers);
  request.fields['name'] = name;
  request.fields['email'] = email;
  request.fields['phone'] = phone;
  request.fields['age'] = age;
  request.files.add(
    await http.MultipartFile.fromPath(
      'image',
      imageFile.path,
    ),
  );
  var response = await request.send();
  Helpers.hideLoader(loader);
  if (response.statusCode == 200) {
    final responseBody = await response.stream.bytesToString();
    return LoginModelApi.fromJson(jsonDecode(responseBody));
  } else {
    final responseBody = await response.stream.bytesToString();
    return LoginModelApi(
      message: jsonDecode(responseBody)['message'],
    );
  }
}


