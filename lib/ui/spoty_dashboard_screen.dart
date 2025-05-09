import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class SpotyDashboardScreen extends StatefulWidget {
  const SpotyDashboardScreen({super.key});
  @override
  State<SpotyDashboardScreen> createState() => _SpotyDashboardScreenState();
}
class _SpotyDashboardScreenState extends State<SpotyDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text("Dashboard"),
        backgroundColor: Colors.green,
     ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, itemIndex,  pageViewIndex){
              return Container(
                margin: EdgeInsets.all(8.0),
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                );
              },
              options: CarouselOptions(
                height: 200,

                aspectRatio: 4/5,
                viewportFraction:2,
                reverse:  false,
                autoPlay: true,


              ),

              ),


            ],
        ),
      ),
    );
  }
}
