import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class OtpScreen extends StatefulWidget {
  final String mobileNumber;
   OtpScreen({super.key, required this.mobileNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController=TextEditingController();
  Future<void> VerifyOtp() async {
    try {
      Map<String, dynamic> params = {
        "mobile": widget.mobileNumber,
        "otp":otpController.text,
      };

      final response = await http.post(
        Uri.parse("https://flipshope.com/api/user/auth/otplogin"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(params),
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print("respone data *******************${responseData}");

        print("Response***: ${responseData['token']}");
        // )));
      } else {
        print("Failed to send OTP: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Error sending OTP: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,

      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextFormField(
              controller: otpController,
              decoration: InputDecoration(
                hintText: "Enter otp",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                    )
                ),
                errorBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                    )
                ),
                focusedErrorBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                    )
                ),

              ),
            ),
          ),
          SizedBox(height: 50,),
          GestureDetector(
            onTap: (){
              VerifyOtp();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text("Login")),
            ),
          )


        ],
      ),
    );
  }
}
