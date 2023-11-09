import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_shop/views/shared/appstyle.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  final _favBox = Hive.box('fav_box');

  _delete(int key) async {
    await _favBox.delete(key);
  }

  Widget build(BuildContext context) {
    List<dynamic> fav = [];
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);

      return {
        "key": key,
        "id": item['id'],
        "category": item['category'],
        "price": item['price'],
        "imageUrl": item['imageUrl']
      };
    }).toList();
    fav = favData.reversed.toList();

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/top_image.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(padding: EdgeInsets.all(8),
              child: Text("My favorites", style: appstyle(40, Colors.white, FontWeight.bold),),
              ),
            ),

            Padding(
              padding:  
              ),
          ],
        ),
      ),
    );
  }
}
