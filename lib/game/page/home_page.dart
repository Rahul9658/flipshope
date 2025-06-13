import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes/constant/background_theme.dart';
import 'package:shoes/game/page/setting_screen.dart';
import 'package:shoes/game/widget/image_widget.dart';
import 'package:shoes/utils/aapAssets.dart';
import 'package:shoes/utils/appcolor.dart';
import 'package:shoes/utils/custome_container_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: backgroundImages(Str.image),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 150,
          ),
          GestureDetector(
            onTap: () {},
            child: CustomeButton(
              height: size.height * 0.06,
              width: size.width * 0.82,
              color: Colors.grey,
              child: Center(
                child: Text(
                  "Play",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: AppColor.black,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingScreen()));
  
            },
            child: CustomeButton(
                height: size.height * 0.06,
                width: size.width * 0.82,
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Settings",
                      style: GoogleFonts.roboto(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                          decoration: TextDecoration.none),
                    ),
                    const Icon(
                      Icons.settings,
                      size: 30,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
