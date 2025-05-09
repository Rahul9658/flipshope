import 'package:flutter/material.dart';

class CustomGridWithAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> itemList = [];

    for (int i = 0; i < 11; i++) {
      if (i == 4) {
        // Full-width Ad
        itemList.add(
          Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text('Ad at $i', style: TextStyle(color: Colors.white)),
            ),
          ),
        );
      } else {
        itemList.add(
          Container(
            height: 150,
            color: Colors.red,
            child: Center(child: Text('Item $i')),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Grid with Full-Width Ad")),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView(
          children: [
            // Wrap in a Wrap widget to handle 2-column grid layout manually
            Wrap(
              spacing: 4.0,
              runSpacing: 4.0,
              children: List.generate(itemList.length, (index) {
                // If it's the ad, make it full width
                if (index == 4) {
                  return Container(
                    width: MediaQuery.of(context).size.width, // Full width (padding considered)
                    child: itemList[index],
                  );
                } else {
                  return Container(
                    width: (MediaQuery.of(context).size.width - 12) / 2,
                    child: itemList[index],
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
