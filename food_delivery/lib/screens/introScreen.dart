import 'package:flutter/material.dart';
import 'package:food_delivery/const/colors.dart';
import 'package:food_delivery/utils/helper.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = "/introScreen";

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var _controller;
  int count = 0;

  final List<Map<String, String>> _pages = [
    {
      "image": "vector1.png",
      "title": "Find Food You Love",
      "desc":
          "Discover the best food from over 2,00 restaurants and fast delivary to your doorstep"
    },
    {
      "image": "vector2.png",
      "title": "Fast Delivery",
      "desc": "Fast food delivery to your home, office wherever you are"
    },
    {
      "image": "vector3.png",
      "title": "Live Tracking",
      "desc":
          "Real time tracking of your food on the app once you placed the order"
    },
  ];

  void initState() {
    _controller = PageController();
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 500,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        count = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        Helper.getAssetName(_pages[index]["image"]!, "virtual"),
                      );
                    },
                    itemCount: _pages.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          count == 0 ? AppColor.orange : AppColor.placeholder,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          count == 1 ? AppColor.orange : AppColor.placeholder,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          count == 2 ? AppColor.orange : AppColor.placeholder,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  _pages[count]["title"]!,
                  style: Helper.getTheme(context).headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  _pages[count]["desc"]!,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Next"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
