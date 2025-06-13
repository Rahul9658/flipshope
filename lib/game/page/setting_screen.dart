import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes/constant/background_theme.dart';
import 'package:shoes/game/widget/image_widget.dart';
import 'package:shoes/utils/aapAssets.dart';
import 'package:shoes/utils/appcolor.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}
class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: backgroundImages(Str.image),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: size.height * 0.18,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: size.height * 0.60,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
                color: Colors.grey,
              ),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Text(
                    "Settings",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        decoration: TextDecoration.none,
                        color: AppColor.black),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
