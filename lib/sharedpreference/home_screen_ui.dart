import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/provider/shared_pref_screen.dart';
import 'package:shoes/sharedpreference/shared_preference_data.dart';
import 'package:shoes/utils/customeTextfield.dart' show CustomeTextfield;
import 'package:shoes/utils/custome_container_button.dart' show CustomeButton;

class HomeScreenUi extends StatefulWidget {
  const HomeScreenUi({super.key});

  @override
  State<HomeScreenUi> createState() => _HomeScreenUiState();
}

class _HomeScreenUiState extends State<HomeScreenUi> {
  @override
  void initState() {
    context.read<SharedProvider>().lodedData();
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final sharedProvider = context.watch<SharedProvider>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: const Color(0xFF6B38FB),
        title: const Text("Shared Preference"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              CustomeTextfield(
               controller:sharedProvider.nameController ,
                hintText: "Enter name",
              ),
              const SizedBox(height: 20,),
              CustomeTextfield(
                controller:sharedProvider.fullNameController ,
                hintText: "Enter fullName",
              ),
              const SizedBox(height: 20,),
              CustomeTextfield(
                controller:sharedProvider.emailController ,
                hintText: "Enter email",
              ),
              const SizedBox(height: 20,),
              CustomeTextfield(
                controller:sharedProvider.passwordController,
                hintText: "Enter password",
              ),

              const SizedBox(height: 20,),
              Text("name----------------${sharedProvider.name}"),
              Text("name----------------${sharedProvider.fullName}"),
              Text("name----------------${sharedProvider.email}"),
              Text("name----------------${sharedProvider.password}"),

              const SizedBox(height: 30,),
              GestureDetector(
                onTap: () async{
                   sharedProvider.saveFiterData();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SharedPreferenceData()));
                },
                child: CustomeButton(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white),)),
                ),
              )
              //     SizedBox(height: context.height*0.01,)
            ],
          ),
        ),
      ),
    );
  }
}


