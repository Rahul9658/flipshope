import 'package:flutter/material.dart';
import 'package:shoes/utils/customeTextfield.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Home Screen"),
        toolbarHeight: 70,
        backgroundColor: Color(0xFF6B38FB),
      ),
      body: Column(
        children: [

        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10  ),
        child: Row(
          children: [

            Flexible(
              child: CustomeTextfield(
                  hintText: "Type messages......",
                  controller:messageController,
              ),
            ),
            IconButton(onPressed: () {} , icon: Icon(Icons.send),)
          ],
        ),
      ),
    );
  }
}
