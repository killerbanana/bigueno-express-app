import 'package:biguenoexpress/screens/authenticate/login/login_screen.dart';
import 'package:biguenoexpress/screens/food_delivery_screen/food_delivery_seller_screen.dart';
import 'package:biguenoexpress/screens/home/home_screen.dart';
import 'package:biguenoexpress/screens/merchant/merchant_profile.dart';
import 'package:flutter/widgets.dart';
import 'wrapper.dart';

final Map<String, WidgetBuilder> routes = {
  Wrapper.routeName: (context) => Wrapper(),
  LogInScreen.routeName: (context) => LogInScreen(),
  HomePage.routeName: (context) => HomePage(),
  MerchantProfile.routeName: (context) => MerchantProfile(),
  FoodDeliverySellerScreen.routeName: (context) => FoodDeliverySellerScreen(),
};

