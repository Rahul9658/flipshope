import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes/provider/group_provider.dart';
import 'package:shoes/utils/appcolor.dart';
import 'package:shoes/utils/customeTextfield.dart';
class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final groupProvider = context.watch<GroupProvider>();
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
         toolbarHeight: 70,
        title: const Text("Update Profile"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Center(
                child: GestureDetector(
                  onTap: (){
                    groupProvider.pickImage();
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: groupProvider.pickedImage != null
                          ? DecorationImage(
                        image: FileImage(groupProvider.pickedImage!),
                        fit: BoxFit.cover,
                      )
                          : null,
                      border: Border.all(color: Colors.black),
                    ),
                    child: groupProvider.pickedImage == null ? const Icon(Icons.person_outline,size: 50,) : null,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text("Name"),
              const SizedBox(height: 15,),
              CustomeTextfield(
                  hintText: "Enter name",
                  controller: groupProvider.nameController
              ),
              const SizedBox(height: 20,),
              const Text("Email"),
              const SizedBox(height: 15,),
              CustomeTextfield(
                  hintText: "Enter email",
                  controller: groupProvider.emailController
              ),
              const SizedBox(height: 20,),
              const Text("PhoneNumber"),
              const SizedBox(height: 15,),
              CustomeTextfield(
                  hintText: "Enter phoneNumber",
                  controller: groupProvider.phoneController
              ),
              const SizedBox(height: 20,),
              const Text("Age"),
              const SizedBox(height: 15,),
              CustomeTextfield(
                  hintText: "Enter age",
                  controller: groupProvider.ageController
              ),
              const SizedBox(height: 20,),
              Container(
                height: MediaQuery.of(context).size.height*0.06,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.indigo,
                ),
                child: Center(
                  child: Text("Submit",style: GoogleFonts.roboto
                    (fontSize: 16,fontWeight:
                  FontWeight.w700,color:
                  AppColor.white
                  ), ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
