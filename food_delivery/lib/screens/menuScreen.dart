import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/customNavBar.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = "/menuScreen";
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              menu: true,
            ),
          ),
        ],
      ),
    );
  }
}
