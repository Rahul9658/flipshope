import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes/utils/appcolor.dart';
import 'package:shoes/utils/customeTextfield.dart';
import 'package:shoes/utils/custome_container_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'fetch_data_screen.dart';
class CloudStore extends StatefulWidget {
  const CloudStore({super.key});

  @override
  State<CloudStore> createState() => _CloudStoreState();
}

class _CloudStoreState extends State<CloudStore> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController  fullNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  Future<void> adduserData()async {
    try{
      FirebaseFirestore.instance.collection("users").add({
        "name": nameController.text,
        "fullName": fullNameController.text,
        "email": emailController.text,
        "age": ageController.text,
      });
      Fluttertoast.showToast(
        msg: "User added successfully!",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      nameController.clear();
      fullNameController.clear();
      emailController.clear();
      ageController.clear();

    }catch(e){
      throw Exception("Lode data Failed");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF2D63DF),
        title: Text("Flutter firebase ",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w600, color: AppColor.white),),
        toolbarHeight: 70,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SizedBox(height: 20,),
              Text("Name",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16),),
              SizedBox(height: 10,),
              CustomeTextfield(
                controller: nameController,
                hintText: "Enter name",
              ),
              SizedBox(height: 20,),
              Text("FullName",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16),),
              SizedBox(height: 10,),
              CustomeTextfield(
                controller: fullNameController,
                hintText: "Enter full name",
              ),
              SizedBox(height: 20,),
              Text("Email",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16),),
              SizedBox(height: 10,),
              CustomeTextfield(
                controller: emailController,
                hintText: "Enter email",
              ),
              SizedBox(height: 20,),
              Text("Age",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,fontSize: 16),),
              SizedBox(height: 10,),
              CustomeTextfield(
                controller: ageController,
                hintText: "Enter email",
              ),
              SizedBox(height: 50,),
              GestureDetector(
                onTap: (){
                  adduserData();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FetchDataScreen()));
                },
                child: CustomeButton(
                  height: MediaQuery.of(context).size.height*0.06,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text("Add",style:
                    GoogleFonts.roboto(fontSize: 18,fontWeight:
                    FontWeight.w800,color: Colors.white,
                    ),),
                  ),
          
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
