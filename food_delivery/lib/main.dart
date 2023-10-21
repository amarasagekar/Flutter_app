import 'package:flutter/material.dart';
import 'package:food_delivery/const/colors.dart';
import 'package:food_delivery/screens/ChangeAddress.dart';
import 'package:food_delivery/screens/aboutScreen.dart';
import 'package:food_delivery/screens/checkoutScreen.dart';
import 'package:food_delivery/screens/dessertScreen.dart';
import 'package:food_delivery/screens/forgetPwScreen.dart';
import 'package:food_delivery/screens/homeScreen.dart';
import 'package:food_delivery/screens/inboxScreen.dart';
import 'package:food_delivery/screens/introScreen.dart';
import 'package:food_delivery/screens/landingScreen.dart';
import 'package:food_delivery/screens/menuScreen.dart';
import 'package:food_delivery/screens/myOrderScreen.dart';
import 'package:food_delivery/screens/newPwScreen.dart';
import 'package:food_delivery/screens/notificationScreen.dart';
import 'package:food_delivery/screens/paymentScreen.dart';
import 'package:food_delivery/screens/sentOTPScreen.dart';
import './screens/splashScreen.dart';
import './screens/loginScreen.dart';
import './screens/singUpScreen.dart';
import 'screens/individualItem.dart';
import 'screens/moreScreen.dart';
import 'screens/offerScreen.dart';
import 'screens/profileScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Metropolis",
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              AppColor.orange,
            ),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            ),
            elevation: MaterialStateProperty.all(0),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(AppColor.orange),
          ),
        ),
        textTheme: const TextTheme(
          headline3: TextStyle(
            color: AppColor.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: AppColor.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          headline5: TextStyle(
            color: AppColor.primary,
            fontWeight: FontWeight.normal,
            fontSize: 25,
          ),
          headline6: TextStyle(
            color: AppColor.primary,
            fontSize: 25,
          ),
          bodyText2: TextStyle(
            color: AppColor.secondary,
          ),
        ),
      ),
      home: SplashScreen(),
      routes: {
        LandingScreen.routeName: (context) => LandingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        ForgetPwScreen.routeName: (context) => ForgetPwScreen(),
        SendOTPScreen.routeName: (context) => SendOTPScreen(),
        NewPwScreen.routename: (context) => NewPwScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        MenuScreen.routeName: (context) => MenuScreen(),
        OfferScreen.routeName: (context) => OfferScreen(),
        MoreScreen.routeName: (context) => MoreScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        DesertScreen.routeName: (context) => DesertScreen(),
        IndividualScreen.routeName: (context) => IndividualScreen(),
        PaymentScreen.routeName: (context) => PaymentScreen(),
        NotificationScreen.routeName: (context) => NotificationScreen(),
        AboutScreen.routeName: (context) => AboutScreen(),
        InboxScreen.routeName:(context) => InboxScreen(),
        MyOrderScreen.routeName:(context) => MyOrderScreen(),
        CheckoutScreen.routeName:(context) => CheckoutScreen(),
        ChangeAddressScreen.routeName:(context) => ChangeAddressScreen(),
      },
    );
  }
}
