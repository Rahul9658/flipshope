import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApiUrl{

  static const String  Store ="https://flipshope.com/api/prices/graphstores";
  static const String  lootDeals ="https://flipshope.com/api/prices/getrecentpricedrop";
  static const String recientPrice="https://flipshope.com/api/prices/getrecentpricedrop";
  static const String login="https://flipshope.com/api/prices/getrecentpricedrop";
  static const String updateProfile="https://flipshope.com/api/prices/getrecentpricedrop";
}

class Helpers {
  // Show Loader
  static OverlayEntry overlayLoader(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Semi-transparent background
          Opacity(
            opacity: 0.5,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.black,
            ),
          ),
          // Animated loader in the center
          const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              strokeWidth: 4,
            ),
          ),
        ],
      ),
    );
  }

  // Hide Loader
  static void hideLoader(OverlayEntry loader) {
    loader.remove();
  }
}
