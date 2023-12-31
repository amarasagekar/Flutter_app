import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:online_shop/controllers/product_provider.dart';
import 'package:online_shop/views/shared/category_btn.dart';
import 'package:online_shop/views/shared/custom_spacer.dart';
import 'package:online_shop/views/shared/stagger_tile.dart';
import 'package:provider/provider.dart';

import '../../models/sneaker_model.dart';
import '../../services/helper.dart';
import '../shared/appstyle.dart';
import '../shared/latest_shoes.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  State<ProductByCart> createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController.animateTo(widget.tabIndex, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // List<String> brand = [
  //   "assets/images/adidas.png",
  //   "assets/images/gucci.png",
  //   "assets/images/jordan.png",
  //   "assets/images/nike.png",
  // ];
  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    productNotifier.getFemale();
    productNotifier.getMale();
    productNotifier.getKids();

    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/top_image.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            AntDesign.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: Icon(
                            FontAwesome.sliders,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    tabs: const [
                      Tab(
                        text: "Men Shoes",
                      ),
                      Tab(
                        text: "Women Shoes",
                      ),
                      Tab(
                        text: "Kids Shoes",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.175,
                left: 16,
                right: 12,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    latestShoe(male: productNotifier.male),
                    latestShoe(male: productNotifier.female),
                    latestShoe(male: productNotifier.kids),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.84,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.black38,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  const CustomSpacer(),
                  Text(
                    "Filter",
                    style: appstyle(40, Colors.black, FontWeight.bold),
                  ),
                  const CustomSpacer(),
                  Text(
                    "Gender",
                    style: appstyle(20, Colors.black, FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const CategoryBtn(buttonClr: Colors.black, label: "Men"),
                      const CategoryBtn(buttonClr: Colors.grey, label: "Women"),
                      const CategoryBtn(buttonClr: Colors.grey, label: "Kids"),
                    ],
                  ),
                  CustomSpacer(),
                  Text(
                    "Category",
                    style: appstyle(20, Colors.black, FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const CategoryBtn(
                          buttonClr: Colors.black, label: "Shoes"),
                      const CategoryBtn(
                          buttonClr: Colors.grey, label: "Apparrels"),
                      const CategoryBtn(
                          buttonClr: Colors.grey, label: "Accessories"),
                    ],
                  ),
                  CustomSpacer(),
                  Text(
                    "Price",
                    style: appstyle(20, Colors.black, FontWeight.bold),
                  ),
                  CustomSpacer(),
                  Slider(
                      value: _value,
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.black,
                      max: 500,
                      divisions: 50,
                      label: _value.toString(),
                      secondaryTrackValue: 200,
                      onChanged: (double value) {}),
                  CustomSpacer(),
                  Text(
                    "Select Brand",
                    style: appstyle(20, Colors.black, FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 80,
                    child: ListView.builder(
                        itemCount: brand.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Image.asset(
                                brand[index],
                                height: 60,
                                width: 80,
                                color: Colors.black,
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
