import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/custome_container_button.dart';
class AllAuthScreen extends StatefulWidget {
  const AllAuthScreen({super.key});
  @override
  State<AllAuthScreen> createState() => _AllAuthScreenState();
}
class _AllAuthScreenState extends State<AllAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: ()async{
      Navigator.pop(context);
      return true;
    },
      child: Scaffold(
        backgroundColor: Color(0xFF000000),
          body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.spotify,size: 70,color: Colors.white,)),
            const SizedBox(height: 10,),
            Text("Sign up to start \nlistening",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16),),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height*0.05,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xFF45B753),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.email_outlined),
                  SizedBox(width: 10,),
                  Text("Continue with email",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600, color: Colors.black),)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.height*0.05,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Colors.grey
                  )
              ),
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Icon(Icons.phone_android,color: Colors.grey,),
                  // FaIcon(FontAwesomeIcons.phoenixFramework,color: Colors.grey,),
                  SizedBox(width: 10,),
                  Text("Continue with phoneNumber",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.height*0.05,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Colors.grey
                  )
              ),
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  const FaIcon(
                    FontAwesomeIcons.google,
                    color: Color.fromARGB(200, 66, 133, 244), // A Google blue tone
                  ),
                  SizedBox(width: 10,),

                  Text("Continue with google",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),)
                ],
              ),
            )




          ],
        ),
      ),

    );
  }
}
