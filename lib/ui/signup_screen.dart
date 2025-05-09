import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes/utils/customeTextfield.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          Navigator.pop(context);
          return true;
         },
      child:Scaffold(
          backgroundColor: const Color(0xFF000000),

          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome back ",style: GoogleFonts.
                roboto(fontSize: 16,fontWeight: FontWeight.
                w600,color: Colors.white),),
                const SizedBox(height: 20,),
                Text("Email",style: GoogleFonts.roboto(fontWeight:
                FontWeight.w600,fontSize:
                16,color: Colors.white),),
                const SizedBox(height: 10,),
                CustomeTextfield(
                  hintText: "Enter email",
                  controller:emailController,

                ),
                const SizedBox(height: 20,),
                Text("Password",style: GoogleFonts.
                roboto(fontWeight: FontWeight.w600,
                    fontSize: 16,color: Colors.white),),
                const SizedBox(height: 10,),
                CustomeTextfield(
                  hintText: "Enter password",
                  controller:passwordController,
                ),
                const SizedBox(height: 50,),

                Container(
                  height: MediaQuery.of(context).size.height*0.07,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFF45B753),
                  ),
                  child: const Text("Sign Up",style:
                  TextStyle(fontSize: 16,fontWeight:
                  FontWeight.w600,color: Colors.white),),
                )


              ],
            ),
          ),

        ),
    );
  }
}
