import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:shoes/provider/group_provider.dart';
import 'package:shoes/utils/customeTextfield.dart';
import 'package:shoes/utils/custome_container_button.dart';
class LoginFlowScreen extends StatefulWidget {
  const LoginFlowScreen({super.key});

  @override
  State<LoginFlowScreen> createState() => _LoginFlowScreenState();
}

class _LoginFlowScreenState extends State<LoginFlowScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final groupProvider = Provider.of<GroupProvider>(context);
    return  Scaffold(
      appBar: AppBar(
        title: Text("Login Flow All Screen"),
        backgroundColor: Color(0xFF2D63DF),
        toolbarHeight: 70,
      ),
       body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                CustomeTextfield(
                  hintText: 'please enter email',
                  controller: groupProvider.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'email is required'),
                    EmailValidator(errorText: 'please enter a valid email'),
                  ]),
                ),
                SizedBox(height: 20,),
                CustomeTextfield(
                  hintText: 'please enter password',
                  controller: groupProvider.passwordController,
                  // validator: MultiValidator([
                  //   RequiredValidator(errorText: 'password is required'),
                  //   MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
                  //   PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                  //       errorText: 'passwords must have at least one special character')
                  // ])  ,
                ),
                SizedBox(height: 20,),
                TextFormField(
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    if(formKey.currentState!.validate()){
                      groupProvider.login(context );
                    }
                  },
                  child: CustomeButton(
                    height: MediaQuery.of(context).size.height*0.06,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: Text("Login",
                      style: TextStyle(fontWeight:
                      FontWeight.w700,fontSize:
                      18,color: Colors.white),)),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
