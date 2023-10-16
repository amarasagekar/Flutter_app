import 'package:flutter/material.dart';
import 'package:food_delivery/const/colors.dart';
import 'package:food_delivery/screens/paymentScreen.dart';
import 'package:food_delivery/utils/helper.dart';
import 'package:food_delivery/widgets/customNavBar.dart';

class MoreScreen extends StatelessWidget {
  static const routeName = "/moreScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "More",
                          style: Helper.getTheme(context).headline5,
                        ),
                        Image.asset(
                          Helper.getAssetName("cart.png", "virtual"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MoreCard(
                      name: "Payment detail",
                      image: Image.asset(
                        Helper.getAssetName("income.png", "virtual"),
                      ),
                      handler: () {
                        Navigator.of(context)
                            .pushNamed(PaymentScreen.routeName);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MoreCard(
                      name: "My Order",
                      image: Image.asset(
                        Helper.getAssetName("shopping_bag.png", "virtual"),
                      ),
                      handler: () {
                        Navigator.of(context)
                            .pushNamed(PaymentScreen.routeName);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MoreCard(
                      name: "Notification",
                      image: Image.asset(
                        Helper.getAssetName("noti.png", "virtual"),
                      ),
                      isNoti: true,
                      handler: () {
                        Navigator.of(context)
                            .pushNamed(PaymentScreen.routeName);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MoreCard(
                      name: "Inbox",
                      image: Image.asset(
                        Helper.getAssetName("mail.png", "virtual"),
                      ),
                      handler: () {
                        Navigator.of(context)
                            .pushNamed(PaymentScreen.routeName);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MoreCard(
                      name: "About us",
                      image: Image.asset(
                        Helper.getAssetName("info.png", "virtual"),
                      ),
                      handler: () {
                        Navigator.of(context)
                            .pushNamed(PaymentScreen.routeName);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              more: true,
            ),
          ),
        ],
      ),
    );
  }
}

class MoreCard extends StatelessWidget {
  const MoreCard({
    super.key,
    required String name,
    required Image image,
    bool isNoti = false,
    required VoidCallback handler,
  })  : _name = name,
        _image = image,
        _isNoti = isNoti,
        _handler = handler;

  final String _name;
  final Image _image;
  final bool _isNoti;
  final VoidCallback _handler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handler,
      child: Container(
        height: 70,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              margin: const EdgeInsets.only(
                right: 20,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: AppColor.placeholderBg,
              ),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: AppColor.placeholder,
                    ),
                    child: _image,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    _name,
                    style: TextStyle(color: AppColor.primary),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 40,
                width: 40,
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: AppColor.placeholderBg,
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.secondary,
                  size: 17,
                ),
              ),
            ),
            if (_isNoti)
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 20,
                  width: 20,
                  margin: const EdgeInsets.only(
                    right: 50,
                  ),
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      "15",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
