import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes/screen/cloud_store.dart';
import 'package:shoes/utils/appcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FetchDataScreen extends StatefulWidget {
  const FetchDataScreen({super.key});
  @override
  State<FetchDataScreen> createState() => _FetchDataScreenState();
}
class _FetchDataScreenState extends State<FetchDataScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CloudStore()));
        }, icon: Icon(Icons.arrow_back,color: AppColor.white,)),
        backgroundColor: Color(0xFF2D63DF),
        title: Text("Fetch User Data ",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600, color: AppColor.white),),
        toolbarHeight: 70,
       ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (context ,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }
            if(snapshot.hasError){
              return Center(child: Text("Sothing Worring"));
            }
            if(snapshot.hasError || snapshot.data!.docs.isEmpty){
              return const Text(" not found data");
            }
             final userData = snapshot.data!.docs;
            return ListView.builder(
              itemCount: userData.length,
                itemBuilder: (context , index){
                  final user = userData[index].data() as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text("Name: ${user['name'] ?? 'No Name'}",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16),),
                      SizedBox(height: 20,),
                      Text("FullName: ${user['fullName'] ?? 'No Name'}",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16),),
                      SizedBox(height: 20,),
                      Text("Email: ${user['email'] ?? 'No Name'}",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16),),
                      const SizedBox(height: 20,),
                      Text("Age: ${user['age'] ?? 'No Name'}",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16),),
                    ],
                  ),
                );

            });
            
          }
      ),
    );
  }

}
