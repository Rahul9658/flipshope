import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes/routie/my_routes.dart';
class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}
class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop();
           return  true;
        },
        child: Scaffold(
          backgroundColor: const Color(0xFF000000),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.spotify,size: 70,color: Colors.white,)),
              const SizedBox(height: 20,),
              Text("Millions of songs.",style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
              const SizedBox(height: 0,),
              Text("Free on Spotify.",style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.w600,color:Colors.white),),
              const SizedBox(height: 50,),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, appRoutes.allAuthScreen);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height*0.06,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFF45B753),
                  ),
                  child: Center(child: Text("SignUp for free",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.black),)),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: MediaQuery.of(context).size.height*0.05,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey,
                    )
                ),
                child: Center(child: Text("Login",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white),)),
              )
            ],
          ),
        ) ,

        );
  }
}
