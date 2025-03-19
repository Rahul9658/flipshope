import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/screen/home_sceen.dart';
import 'package:shoes/view_model/provider_class.dart';

void main(){
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=>StoreProvider(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeSceen(),

      ),

    );
  }
}
