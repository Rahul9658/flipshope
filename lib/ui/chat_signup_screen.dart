import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes/provider/message_provider.dart';
import 'package:shoes/ui/chat_login_screeen.dart';
import 'package:shoes/utils/customeTextfield.dart';
import 'package:shoes/utils/custome_container_button.dart';
class ChatSignupScreen extends StatefulWidget {
  const ChatSignupScreen({super.key});

  @override
  State<ChatSignupScreen> createState() => _ChatSignupScreenState();
}

class _ChatSignupScreenState extends State<ChatSignupScreen> {
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
                SizedBox(height: size.height*0.18,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text("SignUp",style: GoogleFonts.roboto(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white),),
                ),
                SizedBox(height: size.height * 0.02,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
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
                        SizedBox(height: size.height*0.03,),
                        Text("Email",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w700),),
                        SizedBox(height: size.height*0.02,),
                        CustomeTextfield(
                          hintText: "Enter email",
                          controller: messagesProvider.emailController,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "please enter your email"),
                            EmailValidator(errorText: 'please enter a valid email'),
                          ]).call,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text("Password",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w700),),
                        SizedBox(height: size.height*0.02,),
                        CustomeTextfield(
                          maxLines: 1,
                          hintText: "Enter password",
                          controller: messagesProvider.passwordController,
                          obscureText: !messagesProvider.isvisiblepassword,
                          suffixIcon: IconButton(onPressed:
                            messagesProvider.setpassword,
                         icon: Icon(
                              messagesProvider.isvisiblepassword ? Icons.visibility_off:
                              Icons.visibility,color: Colors.grey,)),
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'please enter your password '),
                            MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
                            PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                                errorText: 'passwords must have at least one special character')
                          ]).call,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        GestureDetector(
                          onTap: (){
                            if(fomkey.currentState!.validate()){
                              messagesProvider.signupFirebase(context);

                            }
                          },
                          child: CustomeButton(
                            height: size.height * 0.06,
                            width: size.width,
                            color: Colors.indigo,
                            child: Center(
                              child: Text("SignUp",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,color: Colors.white,
                                ),),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height*0.03,),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already hvae an account? ",
                      style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ChatLoginScreeen()));
                      },
                      child: Text("Login",
                          style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
               const  SizedBox(height: 20,),
              ],
            ),
          ),
      ),
    );
  }
}
