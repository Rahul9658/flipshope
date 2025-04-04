import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'otp_screen.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  Future<void> mobileSignUp() async {
    try {
      // Validate mobile number
      String mobileNumberController = mobileController.text.trim();
      if (mobileNumberController.isEmpty) {
        print("Error: Mobile number is empty!");
        return;
      }

      Map<String, dynamic> params = {
        "mobile": mobileNumberController,
      };

      final response = await http.post(
        Uri.parse("https://flipshope.com/api/user/auth/sendloginotp"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(params),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print("respone data *******************${responseData}");
        print("Response***: ${responseData['message']}");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(

          mobileNumber:mobileNumberController ,
        )));
      } else {
        print("Failed to send OTP: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Error sending OTP: $e");
    }
  }




  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentication"),
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),

      body: Column(
        children: [
          SizedBox(height: 50,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextFormField(

              maxLength:10,
              controller: mobileController,
              decoration: InputDecoration(
                hintText: "Enter mobile number",
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
              mobileSignUp();
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
