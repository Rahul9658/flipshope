import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MessagesShow extends StatelessWidget {
 final List<RemoteMessage> messages ;

   const MessagesShow({super.key,required this.messages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xFF2158D7),
        toolbarHeight: 70,
        title: Text("Notiification",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white),),

      ),
      body:ListView.builder(
        itemCount:messages.length,
          itemBuilder: (context , index){
           final msg = messages[index];
        return Column(
          children: [
            SizedBox(height: 10,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height*0.15,
            width: MediaQuery.of(context).size.width,
            decoration:  BoxDecoration(
            color: Color(0xFF2158D7),
              borderRadius: BorderRadius.circular(10)
            ),
             
          child: Column(
            children: [
              SizedBox(height: 20,),
              ListTile(
                leading: Icon(Icons.no_accounts,size: 40,color: Colors.white,),
                title: Text("${msg.notification!.title.toString()}",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600,
                color: Colors.white
                ),),
                subtitle: Text("${msg.notification!.body.toString()}",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w500,
                 fontSize: 12
                ),),
              ),

            ],
          )
            )
          ],
        );
      })
    );
  }
}
