import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes/view_model/group_provider.dart' show GroupProvider;

import '../utils/customeTextfield.dart';
class GlobalSignupScreen extends StatefulWidget {
  const GlobalSignupScreen({super.key});

  @override
  State<GlobalSignupScreen> createState() => _GlobalSignupScreenState();
}

class _GlobalSignupScreenState extends State<GlobalSignupScreen> {
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final groupProvider = context.watch<GroupProvider>();
    Size size = MediaQuery.of(context).size;

    return  Scaffold(
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
                  Text("SignUp",style: GoogleFonts.roboto(fontSize: 30 , fontWeight: FontWeight.w700,color: Colors.white),),
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
                          Text("Name",style:GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16,),),
                          SizedBox(height: size.height*0.01,),
                          CustomeTextfield(
                            hintText: 'Enter your name',
                            controller: groupProvider.nameController,
                          ),
                          SizedBox(height: size.height*0.01,),
                          Text("FullName",style:GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16,),),
                          SizedBox(height: size.height*0.01,),
                          CustomeTextfield(
                            hintText: 'Enter your fullName',
                            controller: groupProvider.fullNameController,
                          ),
                          SizedBox(height: size.height*0.01,),
                          Text("Email",style:GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16,),),
                          SizedBox(height: size.height*0.01,),
                          CustomeTextfield(
                            hintText: 'Enter your email',
                            controller: groupProvider.fullNameController,
                          ),
                          SizedBox(height: size.height*0.01,),
                          Text("Password",style:GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16,),),
                          SizedBox(height: size.height*0.01,),
                          CustomeTextfield(
                            hintText: 'Enter your Password',
                            controller: groupProvider.fullNameController,
                          ),
                          SizedBox(height: size.height*0.03,),
                          GestureDetector(
                            onTap: (){
                              groupProvider.addFirebaseMessages();
                            },
                            child: Container(
                              height: size.height*0.06,
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFF6B38FB),
                              ),
                              child: Center(child: Text("SignUp",style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w600,color: const Color(0xFFFFFFFF)),)),
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
                      Text("Already have an account?",style:
                      GoogleFonts.roboto(fontWeight:
                      FontWeight.w600,fontSize: 16,
                          color: const Color(0xFFFFFFFF)),),
                      Text("Login",style:
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
