import 'package:biguenoexpress/models/users.dart';
import 'package:biguenoexpress/screens/authenticate/login/login_screen.dart';
import 'package:biguenoexpress/screens/food_delivery_screen/food_delivery_screen.dart';
import 'package:biguenoexpress/screens/food_delivery_screen/food_delivery_seller_screen.dart';
import 'package:biguenoexpress/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  static String routeName = "/wrapper";
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);

    if(user == null){
      return LogInScreen();
    }
    else{
      return FoodDeliverySellerScreen();
    }
  }
}