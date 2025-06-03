import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;
import 'package:shoes/approute/app_route.dart';
import 'package:shoes/constant/const_screen.dart';
import 'package:shoes/provider/group_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('cookie');
      if (token != null && token.isNotEmpty) {
        final authProvider = Provider.of<GroupProvider>(context, listen: false);
        authProvider.saveToken(token);
        printDebug("${token}",title: "Token");
        Navigator.pushNamed(context, AppRoutes.fetchData);
      } else {
        Navigator.pushNamed(context, AppRoutes.loginScreen);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D63DF),
      body: Center(
          child: Text(
        "Splash Screen",
        style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white),
      )),
    );
  }
}
