import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import  'package:http/http.dart'as http;
import 'package:shoes/services/app_url.dart';
import '../model/user_model.dart';

import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';


TextEditingController phoneController = TextEditingController();

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

// class AuthProvider with ChangeNotifier {
//   String? _token;
//   String? get token => _token;
//   void setToken(String newToken) {
//     _token = newToken;
//     notifyListeners();
//   }
//   void clearToken() {
//     _token = null;
//     notifyListeners();
//   }
// }

// Future<void> fetchUserProfile(BuildContext context) async {
//   final url = Uri.parse('https://your-api.com/profile');
//   final headers = await getAuthHeader(context);
//   final response = await http.get(url, headers: headers);
//   if (response.statusCode == 200) {
//     final body = jsonDecode(response.body);
//     if (body['token'] != null) {
//       final token = body['token'];
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('cookie', token);
//       final authProvider = Provider.of<AuthProvider>(context, listen: false);
//       authProvider.setToken(token);
//
//       print('Token updated from profile response.');
//     }
//
//     print('Profile Data: ${response.body}');
//   } else {
//     print('Error fetching profile: ${response.statusCode}');
//   }
// }


// Future<LoginModel> loginRepo(
//     { email, context,password}) async {
//   OverlayEntry loader = Helpers.overlayLoader(context);
//   Overlay.of(context)!.insert(loader);
//   var map = <String, dynamic>{};
//   map['email'] = email;
//   map['password'] = password;
//   print(map);
//   // try {
//   http.Response response = await http.post(Uri.parse(ApiUrl.login),
//       headers: await getAuthHeader(context), body: jsonEncode(map));
//   log("Sign IN DATA${response.body}");
//   // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
//   //     headers: await getAuthHeader(),body: jsonEncode(map) );
//   if (response.statusCode == 200) {
//     Helpers.hideLoader(loader);
//     print(jsonDecode(response.body));
//     return LoginModel.fromJson(jsonDecode(response.body));
//   } else {
//     Helpers.hideLoader(loader);
//     print(jsonDecode(response.body));
//     return LoginModel(
//       message: jsonDecode(response.body)["message"],
//     );
//   }
//   // }  catch (e) {
//   //   Helpers.hideLoader(loader);
//   //   return ModelCommonResponse(message: e.toString(), success: false);
// }
//
// late LoginModel  loginModel;
// bool isLoading = false;
// TextEditingController emailController = TextEditingController();
// TextEditingController passwordController = TextEditingController();
// login(context){
//   loginRepo(
//     context: context,
//     email: emailController.text,
//     password: passwordController.text,
//     ).then((value) async{
//     loginModel = value;
//     if(value.status==true){
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       pref.setString('cookie', value.authToken.toString());
//       final authProvider = Provider.of<AuthProvider>(context, listen: false);
//       authProvider.setToken(value.authToken.toString());
//       isLoading==true;
//     }
//     if(loginModel.userData!.isVerified==true){
//     }
//
//   }
//   );
// }


File? _image;
final picker = ImagePicker();
Future pickImage() async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {

      _image = File(pickedFile.path);

  }
}
Future<Uint8List?> profileata1() async {
  if (_image == null) {
    log("No image selected.");
    return null;
  }

  Uint8List imageBytes = await _image!.readAsBytes();
  log("Image bytes length: ${imageBytes.length}");
  return imageBytes;
}


// Future<LoginModel> updateProfileRepo({
//  required  BuildContext context,
//   Uint8List? profileImage,
//   Map<String, dynamic>? additionalData, // New parameter to pass additional key-value pairs
// }) async {
//   OverlayEntry loader = Helpers.overlayLoader(context);
//   Overlay.of(context).insert(loader);
//
//   var uri = Uri.parse(ApiUrl.updateProfile); // Replace with the actual API endpoint
//
//   var request = http.MultipartRequest('POST', uri);
//   request.headers.addAll(await getAuthHeader(context),
//       body: jsonEncode(map)
//   );
//
//
//
//   // Adding additional data fields if provided
//   if (additionalData != null) {
//     additionalData.forEach((key, value) {
//       request.fields[key] = value.toString(); // Convert value to String if necessary
//     });
//   }
//
//   // Adding profile image if provided
//   if (profileImage != null) {
//     request.files.add(http.MultipartFile.fromBytes(
//       'profile_image',
//       profileImage,
//       contentType: MediaType('image', 'jpeg'),
//       filename: 'profile_image.jpg',
//     ));
//   } else {
//     log('No profile image provided.');
//   }
//
//
//     http.Response response = await http.Response.fromStream(await request.send());
//     log("Update Profile Response: ${response.body}");
//
//     if (response.statusCode == 200) {
//       Helpers.hideLoader(loader);
//       print(jsonDecode(response.body));
//       return LoginModel.fromJson(jsonDecode(response.body));
//       // Handle success response
//       // showToast("Profile updated successfully.");
//     } else {
//       Helpers.hideLoader(loader);
//       print(jsonDecode(response.body));
//       return LoginModel(
//         message: jsonDecode(response.body)["message"],
//       );
//       // showToast("Failed to update profile: ${jsonDecode(response.body)['message']}");
//     }
//
//   // catch (e) {
//   //   Helpers.hideLoader(loader);
//   //   print('Error: $e');
//   //   // showToast("An error occurred while updating the profile.");
//   // }
// }


// void profileata(BuildContext context) async {
//   Map<String, dynamic> extraData = {
//     'phone_number': phoneController.text,
//     'address': '123 Main Street',
//     'gender': 'Female',
//   };
//
//   Uint8List? profileImage = await profileata1();
//
//   if (profileImage == null) {
//     log("No image to upload");
//     return;
//   }
//
//   LoginModel result = await updateProfileRepo(
//     context: context,
//     profileImage: profileImage,
//     additionalData: extraData,
//   );
//
//   log("Profile update result: ${result.message}");
// }


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