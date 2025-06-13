import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes/provider/message_provider.dart';
import 'package:shoes/ui/chat_signup_screen.dart';
import 'package:shoes/utils/customeTextfield.dart';
import 'package:shoes/utils/custome_container_button.dart';

class ChatLoginScreeen extends StatefulWidget {
  static const String routeName = "login_screen";
  const ChatLoginScreeen({super.key});

  @override
  State<ChatLoginScreeen> createState() => _ChatLoginScreeenState();
}

class _ChatLoginScreeenState extends State<ChatLoginScreeen> {
  final fomkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final messagesProvider = context.watch<MessageProvider>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Form(
        key: fomkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.18,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text("Welcome Back",style: GoogleFonts.roboto(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white),),
              ),
              SizedBox(height: size.height * 0.02,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        "Email",
                        style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      CustomeTextfield(
                        hintText: "Enter email",
                        controller: messagesProvider.emailController,
                        validator: MultiValidator([
                          RequiredValidator(errorText: "please enter your email"),
                        ]),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        "Password",
                        style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      CustomeTextfield(
                        maxLines: 1,
                        obscureText: !messagesProvider.isvisiblepassword,
                        suffixIcon: IconButton(onPressed:
                        messagesProvider.setpassword,
                            icon: Icon(messagesProvider.isvisiblepassword
                                ? Icons.visibility_off :Icons.visibility,color: Colors.grey,)),
                        hintText: "Enter password",
                        controller: messagesProvider.passwordController,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'please enter your password '),
                        ]),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      GestureDetector(
                        onTap: (){
                          if(fomkey.currentState!.validate()){

                          }
                        },
                        child: CustomeButton(
                          height: size.height * 0.06,
                          width: size.width,
                          color: Colors.indigo,
                          child: Center(
                            child: Text(
                              "Login",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont hvae an account? ",
                    style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ChatSignupScreen()));
                    },
                    child: Text("SignUp",
                        style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
              const  SizedBox(height: 20,),
            ],
          ),
        ),
      )
    );
  }
}
