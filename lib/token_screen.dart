import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import  'package:http/http.dart'as http;
import 'package:shoes/services/app_url.dart';
import 'model/user_model.dart';

Future<Map<String, String>> getAuthHeader(BuildContext context) async {
  final authProvider = Provider.of<AuthProvider>(context, listen: false);
  String? token = authProvider.token;
  if (token == null) {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('cookie');
  }
  return {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    if (token != null)
      HttpHeaders.authorizationHeader: 'Bearer ${token.replaceAll('\"', '')}',
  };
}

//
// Future<void> fetchUserProfile(BuildContext context) async {
//   final url = Uri.parse('https://your-api.com/profile');
//   final headers = await getAuthHeader(context);
//
//   final response = await http.get(url, headers: headers);
//
//   if (response.statusCode == 200) {
//     print('Profile Data: ${response.body}');
//   } else {
//     print('Error fetching profile: ${response.statusCode}');
//   }
// }
//

class AuthProvider with ChangeNotifier {
  String? _token;
  String? get token => _token;
  void setToken(String newToken) {
    _token = newToken;
    notifyListeners();
  }
  void clearToken() {
    _token = null;
    notifyListeners();
  }
}
Future<void> fetchUserProfile(BuildContext context) async {
  final url = Uri.parse('https://your-api.com/profile');
  final headers = await getAuthHeader(context);
  final response = await http.get(url, headers: headers);
  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    if (body['token'] != null) {
      final token = body['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('cookie', token);
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.setToken(token);

      print('Token updated from profile response.');
    }

    print('Profile Data: ${response.body}');
  } else {
    print('Error fetching profile: ${response.statusCode}');
  }
}


Future<LoginModel> loginRepo(
    { email, context,password}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['email'] = email;
  map['password'] = password;
  print(map);
  // try {
  http.Response response = await http.post(Uri.parse(ApiUrl.login),
      headers: await getAuthHeader(context), body: jsonEncode(map));
  log("Sign IN DATA${response.body}");
  // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
  //     headers: await getAuthHeader(),body: jsonEncode(map) );
  if (response.statusCode == 200) {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return LoginModel.fromJson(jsonDecode(response.body));
  } else {
    Helpers.hideLoader(loader);
    print(jsonDecode(response.body));
    return LoginModel(
      message: jsonDecode(response.body)["message"],
    );
  }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
}

late LoginModel  loginModel;
bool isLoading = false;

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

login(context){
  loginRepo(
    context: context,
    email: emailController.text,
    password: passwordController.text,
  ).then((value) async{
    loginModel = value;
    if(value.status==true){
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('cookie', value.authToken.toString());
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.setToken(value.authToken.toString());
      isLoading==true;
    }
    if(loginModel.userData!.isVerified==true){

    }

  }
  );
}


// login(context) {
//   loginRepo(
//       context: context,
//       email: emailLoginController.text.trim().toString(),
//       password: passwordLoginController.text.trim())
//       .then((value) async {
//     loginModel. = value;
//     if (value.status == true) {
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       pref.setString('cookie', value.authToken.toString());
//       statusOfLogin.value = RxStatus.success();
//       showToast(value.message.toString());
//       if(loginModel.value.data?.userData?.isVerified == true){
//         if(loginModel.value.data?.userData?.isProfileComplete == true){
//           Get.offAllNamed(MyRouters.bottomNavbar);
//         }else{
//           Get.to(const WelcomeScreen());
//         }
//       }else{
//         Get.to(const EmailVerificationScreen(), arguments:[emailLoginController.text.trim().toString()]);
//       }
//     } else {
//       statusOfLogin.value = RxStatus.error();
//       showToast(value.message.toString());
//     }
//   });
// }
//  Rx<RxStatus> statusOfLogin = RxStatus.empty().obs;
// Rx<LoginModel> loginModel = LoginModel().obs;