import 'package:flutter/material.dart';
class HomeScreenUi extends StatefulWidget {
  const HomeScreenUi({super.key});

  @override
  State<HomeScreenUi> createState() => _HomeScreenUiState();
}

class _HomeScreenUiState extends State<HomeScreenUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF6B38FB),
              ),
              Positioned(
                bottom: -180,
                top: 0, // Adjust as needed
                // left: MediaQuery.of(context).size.width / 2 - 75, // Center horizontally (150 / 2)
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0xFF6B38FB),

                    )
                  ),
                ),
              ),
              
            ],
          ),
          SizedBox(height: 90,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Flipkart Deals",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
              IconButton(onPressed: (){}, icon: Icon(Icons.edit)),

            ],
          )
         ],
      )


    );
  }
}
