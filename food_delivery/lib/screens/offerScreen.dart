import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/customNavBar.dart';

class OfferScreen extends StatelessWidget {
  static const routeName = "/offerScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              offer: true,
            ),
          ),
        ],
      ),
    );
  }
}
