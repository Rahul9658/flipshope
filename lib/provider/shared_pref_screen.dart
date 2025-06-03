
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedProvider with ChangeNotifier{

   TextEditingController nameController = TextEditingController();
   TextEditingController fullNameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   String? name;
   String? fullName;
   String? email;
   String? password;
   int? count;

  Future <void> saveFiterData() async{
    SharedPreferences _prefes = await SharedPreferences.getInstance();
     await _prefes.setString("name", nameController.text);
     await _prefes.setString('fullName', fullNameController.text);
     await _prefes.setString("email", emailController.text);
     await _prefes.setString('password', passwordController.text);
     await _prefes.setInt('count', count!);
     debugPrint("save data successfully");
     notifyListeners();
  }

   Future<void> lodedData() async{
    SharedPreferences _prefes = await SharedPreferences.getInstance();
     name = await _prefes.getString('name') ??" ";
     fullName = await _prefes.getString('fullName');
     email    = await _prefes.getString('email');
     password = await _prefes.getString('password');
     await _prefes.getString('count');
    debugPrint("loded data successfully");
    debugPrint("-- name -- ${_prefes.getString('name')}");
    notifyListeners();
   }

   Future<void> clearfielter () async {
     SharedPreferences _prefes = await SharedPreferences.getInstance();
     _prefes.clear();
     nameController.clear();
     fullNameController.clear();
     emailController.clear();
   }


}