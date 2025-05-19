import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes/utils/customeTextfield.dart';

import 'dashboard_screen.dart';
import 'global_signup_screen.dart';
import 'notification_services_screen.dart';
class GlobalAuthPage extends StatefulWidget {
  const GlobalAuthPage({super.key});

  @override
  State<GlobalAuthPage> createState() => _GlobalAuthPageState();
}

class _GlobalAuthPageState extends State<GlobalAuthPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  NotificationServicesClass notificationServicesClass = NotificationServicesClass();
  @override
  void initState() {
    notificationServicesClass.recivedNotificationMessages();
    notificationServicesClass.notificationServices();
    notificationServicesClass.deviceToken();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height:size.height ,
        width: size.width,
        color: const Color(0xFF6B38FB),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height*0.23,),
                Text("Welcome back",style: GoogleFonts.roboto(fontSize: 30 , fontWeight: FontWeight.w700,color: Colors.white),),
                SizedBox(height: size.height*0.02,),
                Container(
                  // height: size.height*0.23,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFFFFF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height*0.04,),

                        Text("Email",style:GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16,),),
                        SizedBox(height: size.height*0.01,),
                        CustomeTextfield(
                          hintText: 'Enter your email',
                          controller: emailController,
                        ),
                        SizedBox(height: size.height*0.01,),
                        Text("Password",style:GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16,),),
                        SizedBox(height: size.height*0.01,),
                        CustomeTextfield(
                          hintText: 'Enter your password',
                          controller: passwordController,
                        ),
                        SizedBox(height: size.height*0.03,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> GlobalSignupScreen()));
                          },
                          child: Container(
                            height: size.height*0.06,
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF6B38FB),
                            ),
                            child: Center(child: Text("Login",style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w600,color: const Color(0xFFFFFFFF)),)),
                          ),
                        ),
                        SizedBox(height: size.height*0.04,),

                      ],
                    ),
                  ),
                ),
                 SizedBox(height: size.height*0.03,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Dont have an account?",style:
                     GoogleFonts.roboto(fontWeight:
                     FontWeight.w600,fontSize: 16,
                         color: const Color(0xFFFFFFFF)),),
                     Text("Signup",style:
                     GoogleFonts.roboto(fontWeight:
                     FontWeight.w600,fontSize: 16,
                         color: const Color(0xFFFFFFFF)),),
                   ],
                 )
              ],
            ),
          ),
        ),
      )
    );
  }
}
