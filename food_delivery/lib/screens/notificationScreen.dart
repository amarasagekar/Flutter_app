import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_delivery/const/colors.dart';
import 'package:food_delivery/utils/helper.dart';
import 'package:food_delivery/widgets/customNavBar.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = "/notificationScreen";
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Notifications",
                          style: Helper.getTheme(context).headline5,
                        ),
                      ),
                      Image.asset(
                        Helper.getAssetName("cart.png", "virtual"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                NotiCard(
                  time: "Now",
                  title: "Your order has been picked up",
                  color: AppColor.placeholderBg,
                ),
                SizedBox(
                  height: 20,
                ),
                NotiCard(
                  time: "1h ago",
                  title: "Yoour order has been delivered",
                  color: AppColor.placeholderBg,
                ),
                SizedBox(
                  height: 20,
                ),
                NotiCard(
                    time: "3h ago",
                    title: "Lorem ipsum doller sit amet, consectetur"),
                SizedBox(
                  height: 20,
                ),
                NotiCard(
                    time: "6h ago",
                    title: "Lorem ipsum doller sit amet, consectetur"),
                SizedBox(
                  height: 20,
                ),
                NotiCard(
                  time: "05 Aug 2022",
                  title: "Lorem ipsum doller sit amet, consectetur",
                  color: AppColor.placeholderBg,
                ),
                SizedBox(
                  height: 20,
                ),
                NotiCard(
                  time: "12 Aug 2022",
                  title: "Lorem ipsum doller sit amet, consectetur",
                  color: AppColor.placeholderBg,
                ),
                SizedBox(
                  height: 20,
                ),
                NotiCard(
                  time: "20 july 2022",
                  title: "Lorem ipsum doller sit amet, consectetur",
                  color: AppColor.placeholderBg,
                ),
                SizedBox(
                  height: 20,
                ),
                NotiCard(
                  time: "12 june 2022",
                  title: "Lorem ipsum doller sit amet, consectetur",
                  color: AppColor.placeholderBg,
                ),
              ],
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

class NotiCard extends StatelessWidget {
  const NotiCard({
    super.key,
    required String time,
    required String title,
    Color color = Colors.white,
  })  : _time = time,
        _title = title,
        _color = color;
  final String _time;
  final String _title;
  final Color _color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: _color,
        border: Border(
          bottom: BorderSide(
            color: AppColor.placeholder,
            width: 0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColor.orange,
            radius: 5,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _title,
                style: TextStyle(
                  color: AppColor.primary,
                ),
              ),
              Text(_time),
            ],
          ),
        ],
      ),
    );
  }
}
