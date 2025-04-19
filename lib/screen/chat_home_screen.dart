import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/appcolor.dart';
import 'chat_screen.dart';

class ChatHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChatPage",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600,color: AppColor.white),),
        toolbarHeight: 70,
        backgroundColor: Color(0xFF2D63DF),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("shoppes").snapshots(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshots.hasError) {
            return Center(child: Text("Something went wrong"));
          }

          if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
            return Center(child: Text("No data found"));
          }

          final userData = snapshots.data!.docs;

          return ListView.builder(
            itemCount: userData.length,
            itemBuilder: (context, index) {
              final user = userData[index].data() as Map<String, dynamic>;
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor:Color(0xFF2D63DF) ,
                  child: Text(user['username'][0],style: TextStyle(color: AppColor.white),),
                ),
                title: Text(user["username"] ?? "No Email",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(otherUserId: user['uid'])));
                },
              );
            },
          );
        },
      ),
    );
  }
}
