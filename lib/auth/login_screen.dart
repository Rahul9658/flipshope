import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes/auth/signup_screen.dart';
import 'package:shoes/screen/home_sceen.dart';
import 'package:shoes/screen/notifi_screen.dart';
import 'package:shoes/utils/appcolor.dart';
import 'package:shoes/utils/customeTextfield.dart';
import 'package:shoes/utils/custome_container_button.dart';
import 'package:shoes/view_model/auth_provider.dart';

import '../screen/chat_home_screen.dart';
import '../screen/cloud_store.dart';
import '../screen/messages_show.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   Future<void> login() async{
     try{
       await FirebaseAuth.instance.signInWithEmailAndPassword(
         email:emailController.text,
         password: passwordController.text,
       );
     }
     catch(e){
       throw Exception("Failed login ");
     }
   }
   NotificationServices notificationServices = NotificationServices();
  int notificationCount = 0;
  List<RemoteMessage> messages = [];


  @override
  void initState() {
    super.initState();
    notificationServices.requestServices();
    notificationServices.getDeviceToken();
    notificationServices.firebaseBacgroundMesages();
    notificationServices.firebaseBackgroundMessages((message) {
      setState(() {
        messages.add(message);
        notificationCount++;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProviderdddd>(context);
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 70,
        title: Text("Login Screen",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 18,color: AppColor.white),),
        backgroundColor: Color(0xFF2D63DF),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessagesShow(messages: messages),
                      ),
                    );
                    setState(() {
                      notificationCount = 0; // Clear count on open (optional)
                    });
                  },
                  icon: Icon(Icons.notifications, color: Colors.white, size: 30),
                ),
                if (notificationCount > 0)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: Text(
                        '$notificationCount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                login();
              },
              child: CustomeButton(
                height: MediaQuery.of(context).size.height*0.06,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text("Login",style:
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
                Text("Don't have an account?",style: GoogleFonts.roboto(fontSize:16,fontWeight: FontWeight.w600),),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                  },
                    child: Text("SignUp",
                      style: GoogleFonts.roboto
                      (fontWeight: FontWeight.w600,fontSize: 16,color:Color(0xFF2D63DF),
                    ),)),


              ],
            )
           ],
        ),
      ),
    );
  }
}
