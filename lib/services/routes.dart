import 'package:biguenoexpress/screens/home/home_screen.dart';
import 'package:biguenoexpress/screens/login/login_screen.dart';
import 'package:flutter/widgets.dart';
import 'wrapper.dart';

final Map<String, WidgetBuilder> routes = {
  Wrapper.routeName: (context) => Wrapper(),
  Wrapper.routeName: (context) => LogInScreen(),
  Wrapper.routeName:(context) => HomeScreen()
};

