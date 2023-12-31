import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_delivery/utils/helper.dart';
import 'package:food_delivery/widgets/customNavBar.dart';

import '../const/colors.dart';

class InboxScreen extends StatelessWidget {
  static const routeName = "/inboxScreen";
  const InboxScreen({super.key});

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
                          Icons.arrow_back_ios_new,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Inbox",
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
                  height: 30,
                ),
                MailCard(
                  time: "6th July",
                  title: "MealMonkey Promotions",
                  description:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                ),
                MailCard(
                  time: "6th July",
                  title: "MealMonkey Promotions",
                  description:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  color: AppColor.placeholderBg,
                ),
                MailCard(
                  time: "6th July",
                  title: "MealMonkey Promotions",
                  description:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                ),
                MailCard(
                  time: "6th July",
                  title: "MealMonkey Promotions",
                  description:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  color: AppColor.placeholderBg,
                ),
                MailCard(
                  time: "6th July",
                  title: "MealMonkey Promotions",
                  description:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  color: AppColor.placeholderBg,
                ),
                MailCard(
                  time: "6th July",
                  title: "MealMonkey Promotions",
                  description:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
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

class MailCard extends StatelessWidget {
  const MailCard({
    super.key,
    required String time,
    required String title,
    required String description,
    Color color = Colors.white,
  })  : _time = time,
        _title = title,
        _color = color,
        _description = description;

  final String _time;
  final String _title;
  final String _description;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  style: TextStyle(
                    color: AppColor.primary,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(_description),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _time,
                style: TextStyle(fontSize: 10),
              ),
              Image.asset(
                Helper.getAssetName("star.png", "virtual"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
