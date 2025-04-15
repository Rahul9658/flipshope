import 'package:flutter/material.dart';

class AuthProviderdddd with ChangeNotifier{
   bool _visiblePassword = true;
  bool get isvisiblepassword => _visiblePassword;

  void setpassword(){
    _visiblePassword =!_visiblePassword;
    notifyListeners();
  }

}