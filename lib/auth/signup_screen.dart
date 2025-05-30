import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes/auth/login_screen.dart';
import 'package:shoes/utils/appcolor.dart';
import 'package:shoes/utils/customeTextfield.dart';
import 'package:shoes/utils/custome_container_button.dart';
import 'package:shoes/view_model/auth_provider.dart';

import '../screen/chat_home_screen.dart';
import '../screen/chat_screen.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  // Future<void> signup() async {
  //   try {
  //     final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );
  //     print("User signed up: ${userCredential.user?.uid}");
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => LoginScreen()),
  //     );
  //     Fluttertoast.showToast(
  //         msg: "Register successfully",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.black,
  //         textColor: Colors.white,
  //         fontSize: 16.0
  //     );
  //   } catch (e) {
  //     print("Unknown error: $e");
  //     throw Exception("Signup failed");
  //   }
  // }


  Future<void> signup() async {
    try {
      // Create user with email and password
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),

      );
      await FirebaseFirestore.instance.collection('shoppes').doc(userCredential.user?.uid).set({
        'email': userCredential.user?.email,
        'uid': userCredential.user?.uid,
        'username': usernameController.text.trim(),
        'createdAt': Timestamp.now(),
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatHomeScreen()),
      );
      Fluttertoast.showToast(
        msg: "Sign Up Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );

    } catch (e) {
      print("Signup failed: $e");
      Fluttertoast.showToast(
        msg: "Signup failed: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProviderdddd>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Page",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600,color: AppColor.white),),
        toolbarHeight: 70,
        backgroundColor: Color(0xFF2D63DF),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text("Name",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16),),
              SizedBox(height: 10,),
              CustomeTextfield(
                hintText: "Enter Name",
                controller: usernameController,
              ),
              SizedBox(height: 20,),
              Text("Email",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16),),
              SizedBox(height: 10,),
              CustomeTextfield(
                hintText: "Enter email",
                controller: emailController,
              ),
              SizedBox(height: 20,),
              Text("Password",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16),),
              SizedBox(height: 10,),
          
              CustomeTextfield(
                hintText: "Enter password",
                controller: passwordController,
                obscureText: authProvider.isvisiblepassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    // Toggle password visibility
                    authProvider.setpassword();
                  },
                  icon: Icon(authProvider.isvisiblepassword
                      ? Icons.visibility_off
                      : Icons.visibility
                  ),
                ),
              ),
              SizedBox(height: 50,),
              GestureDetector(
                onTap: (){
                  signup();
                },
                child: CustomeButton(
                  height: MediaQuery.of(context).size.height*0.06,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text("SignUp",style:
                    GoogleFonts.roboto(fontSize: 18,fontWeight:
                    FontWeight.w800,color: Colors.white,
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: GoogleFonts.roboto(fontSize:16,fontWeight: FontWeight.w600),),
                  InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: Text("Login",
                        style: GoogleFonts.roboto
                          (fontWeight: FontWeight.w600,fontSize: 16,color:Color(0xFF2D63DF),
                        ),)),
          
          
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
