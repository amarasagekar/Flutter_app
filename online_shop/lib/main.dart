// @dart=2.17

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_shop/controllers/product_provider.dart';
import 'package:provider/provider.dart';

import 'controllers/mainscreen_provider.dart';
import 'views/ui/mainscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainScreenNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shopping',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
