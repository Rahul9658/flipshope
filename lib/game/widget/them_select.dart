import 'package:flutter/material.dart';
import 'package:shoes/game/widget/image_widget.dart';
class ThemSelect extends StatefulWidget {
  const ThemSelect({super.key});

  @override
  State<ThemSelect> createState() => _ThemSelectState();
}

class _ThemSelectState extends State<ThemSelect> {
  String selecttheme = Str.image;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
        Row(
          children:List.generate(3, (index){
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),


              ),

            );
          }),
        )

        ],
      ),
    );
  }
}
