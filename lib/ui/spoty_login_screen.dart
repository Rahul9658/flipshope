import 'package:flutter/material.dart';
class SpotyLoginScreen extends StatefulWidget {
  const SpotyLoginScreen({super.key});

  @override
  State<SpotyLoginScreen> createState() => _SpotyLoginScreenState();
}

class _SpotyLoginScreenState extends State<SpotyLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return true;
        },
      child: Scaffold(
        backgroundColor: Color(0xFF000000),
      ),

    );
  }
}
