import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes/approute/app_route.dart';
import 'package:shoes/model/login_model.dart' show LoginModelApi;
import 'package:shoes/model/store_model.dart';
import 'package:shoes/repo/signup_repo.dart';
import 'package:shoes/repo/update_repo.dart';
import '../repo/login_repo.dart';
import '../services/api_repositry.dart';
import '../services/app_url.dart';
import '../ui/fetch_data.dart';
class GroupProvider extends ChangeNotifier {
  final _apiRepo =  ApiRepositry();
 StoreModel? storeModel ;
  TextEditingController nameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  Future<dynamic> addFirebaseMessages() async {
    FirebaseFirestore.instance.collection('tester').add({
      'name': nameController.text,
      'fullName': fullNameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    });
    Fluttertoast.showToast(msg: "recived data successfully");
    nameController.clear();
    fullNameController.clear();
    emailController.clear();
    passwordController.clear();
  }


    Future<void> getDealApi() async {
      _apiRepo.getRpdFiltersSTORE().then((value) {
       storeModel = value;
       notifyListeners();
       debugPrint("debug data print ${value.data!.first.storeName}");

    });
  }

  File? pickedImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
      print("Image path: ${pickedImage!.path}");
    } else {
      print("No image selected");
    }
    notifyListeners();
  }


  String? _token;
  String? get token => _token;
  void saveToken(String newToken) {
    _token = newToken;
    notifyListeners();
  }
  Future<void> tokenRemove() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cookie');
    notifyListeners();
  }


  late LoginModelApi  loginModel;
  bool isLoading = false;
  void login(BuildContext context) {
    loginRepo(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    ).then((value) async {
      loginModel = value;
      if (value.code == 200) {
        SharedPreferences pref = await SharedPreferences.getInstance();
         await pref.setString('cookie', value.accessToken.toString());
        saveToken(value.accessToken.toString());
        showToast(value.message.toString());
        Navigator.pushNamed(context, AppRoutes.fetchData,arguments: emailController.text,);
        notifyListeners();
        emailController.clear();
        passwordController.clear();
      } else {
        print("Login failed: ${value.message}");
      }
    }).catchError((error) {
      print("Login error: $error");
      isLoading = false;
      notifyListeners();
    });
  }

 void registerApi( BuildContext context) {
     signupRepo(
       context: context,
       name: nameController.text,
       email:emailController.text,
       password: passwordController.text,
     ).then((value){
       loginModel = value;
       if(value.code == true){

       }
     });
 }

  void updateProfile(BuildContext context) {
    updateProfileRepo(
      context: context,
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      imageFile: pickedImage!,
      age: ageController.text,
    ).then((value) {
      if (value.code == true) {
        showToast("Profile updated successfully");
      } else {
        showToast("Failed: ${value.message}");
      }
      isLoading = false;
      notifyListeners();
    }).catchError((error) {
      print("Profile update error: $error");
      showToast("Error: $error");
      isLoading = false;
      notifyListeners();
    });
  }




}
