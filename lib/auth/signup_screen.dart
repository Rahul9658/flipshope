import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shoes/auth/login_screen.dart';
import 'package:shoes/provider/auth_provider.dart';
import 'package:shoes/utils/appcolor.dart';
import 'package:shoes/utils/customeTextfield.dart';
import 'package:shoes/utils/custome_container_button.dart';

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

  File? _image;
  final picker = ImagePicker();
  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }









 final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<UserCredential> registerbody()async{
    try {
      UserCredential userCredential =
      await firebaseAuth.createUserWithEmailAndPassword(email:emailController.text,
          password: passwordController.text);
      firebaseFirestore.collection("data").doc(userCredential.user!.uid).set({
        'uid':userCredential.user!.uid,
         'name':usernameController.text,
         'email':emailController.text,
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
      return userCredential;

    }

    catch(e){
      throw Exception(e);

    }
 }
  Future<void> signup() async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      await FirebaseFirestore.instance.collection('shoppes').doc(userCredential.user?.uid).set({
        'email': userCredential.user?.email,
        'uid': userCredential.user?.uid,
        'username': usernameController.text.trim(),
        // 'profileImage': imageUrl ?? '', // store URL or empty if no image
        'createdAt': Timestamp.now(),
      });



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
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
      appBar: AppBar(
        title: Text("Signup Page",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600,color: AppColor.white),),
        toolbarHeight: 70,
        backgroundColor: const Color(0xFF2D63DF),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Center(
                child: GestureDetector(
                  onTap: (){
                    pickImage();                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD2D2D2),
                      shape: BoxShape.circle,
                      border: Border.all(),
                    ),
                    child: ClipOval(
                      child: _image != null
                          ? Image.file(
                        _image!,
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      )
                          : const Icon(
                        Icons.person_outline,
                        size: 60,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10,),

              Text("Name",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16),),
              const SizedBox(height: 10,),
              CustomeTextfield(
                hintText: "Enter Name",
                controller: usernameController,
              ),
              const SizedBox(height: 20,),
              Text("Email",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16),),
              const SizedBox(height: 10,),
              CustomeTextfield(
                hintText: "Enter email",
                controller: emailController,
              ),
              const SizedBox(height: 20,),
              Text("Password",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16),),
              const SizedBox(height: 10,),
          
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
              const SizedBox(height: 50,),
              GestureDetector(
                onTap: (){
                  registerbody();
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
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: GoogleFonts.roboto(fontSize:16,fontWeight: FontWeight.w600),),
                  InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                      },
                      child: Text("Login",
                        style: GoogleFonts.roboto
                          (fontWeight: FontWeight.w600,fontSize: 16,color:const Color(0xFF2D63DF),
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
