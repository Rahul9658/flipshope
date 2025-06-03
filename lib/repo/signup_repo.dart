import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:shoes/constant/const_screen.dart';
import 'package:shoes/model/login_model.dart' show LoginModelApi;
import 'package:shoes/model/user_model.dart';
import 'package:shoes/services/app_url.dart';

  Future<LoginModelApi> signupRepo({name , email, context, password }) async {
     Map  <String ,dynamic> map = {};
     map['email'] = email;
     map ['password'] = password;
     map['name'] = name;
     http.Response response = await http.post(Uri.parse(ApiUrl.loginAuth),
     headers: await getAuthHeader(context), body: jsonEncode(map),
     );
     printDebug(response.body);
     if(response.statusCode ==200){
      printDebug(jsonDecode(response.body));
      return LoginModelApi.fromJson(jsonDecode( response.body));
      }
     else{
      return  LoginModelApi(
        message: jsonDecode(response.body)['messages']
      );
    }



  }