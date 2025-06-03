import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes/provider/group_provider.dart';

class ApiUrl{
  static const String  Store ="https://flipshope.com/api/prices/graphstores";
  static const String  Store1 ="https://team.thebestdeals.app/api/deals/getdealsapp";
  static const String  lootDeals ="https://flipshope.com/api/prices/getrecentpricedrop";
  static const String recientPrice="https://flipshope.com/api/prices/getrecentpricedrop";
  static const String login="https://flipshope.com/api/prices/getrecentpricedrop";
  static const String updateProfile="https://flipshope.com/api/prices/getrecentpricedrop";
  static const String loginAuth="https://team.thebestdeals.app/api/auth/signin";
}

class Helpers {
  static OverlayEntry overlayLoader(BuildContext context) {
    return OverlayEntry(
      builder: (context) =>  Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.black,
            ),
          ),
          // Animated loader in the center
          const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              strokeWidth: 4,
            ),
          ),
        ],
      ),
    );
  }
  static void hideLoader(OverlayEntry loader) {
    loader.remove();
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black87,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}


Future<Map<String, String>> getAuthHeader(BuildContext context) async {
  final authProvider = Provider.of<GroupProvider>(context, listen: false);
  String? token = authProvider.token;
  if (token == null) {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('cookie');
  }
  print("save token******${token}");
  return {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    if (token != null)
      HttpHeaders.authorizationHeader: 'Bearer ${token.replaceAll('\"', '')}',
  };
}
