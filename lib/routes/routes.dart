import 'package:flutter/material.dart';
import 'package:travelappui/views/HomePage/homepage.dart';
import 'package:travelappui/views/SplashScreen/splashscreen.dart';
import 'package:travelappui/views/Login/login.dart';
import 'package:travelappui/views/Registro/registro.dart';
import 'package:travelappui/views/HellnHeaven/HellnHeaven.dart';
import 'package:travelappui/views/Therion/Therion.dart';
import 'package:travelappui/views/Aladdin/Aladdin.dart';
import 'package:travelappui/views/ViveLatino/ViveLatino.dart';
import 'package:travelappui/views/UserScreen/userScreen.dart';

class AppRoutes {
  static const String ROUTE_Initial = ROUTE_Splashscreen;

  static const String ROUTE_Home = "/home";
  static const String ROUTE_Splashscreen = "/splash";
  static const String ROUTE_ViewDetails = "/view";
  static const String ROUTE_Login = "/login";
  static const String ROUTE_Registro = "/registro";
  static const String ROUTE_HellnHeaven = "/HellnHeaven";
  static const String ROUTE_Therion = "/Therion";
  static const String ROUTE_Aladdin = "/Aladdin";
  static const String ROUTE_ViveLatino = "/ViveLatino";
  static const String ROUTE_UserScreen = "/userScreen";

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_Home:
        return MaterialPageRoute(
            settings: settings, builder: (_) => HomePage());
        break;
      case ROUTE_Splashscreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => SplashScreen());
        break;
      case ROUTE_Login:
        return MaterialPageRoute(settings: settings, builder: (_) => Login());
        break;
      case ROUTE_Registro:
        return MaterialPageRoute(
            settings: settings, builder: (_) => Registro());
        break;
      case ROUTE_HellnHeaven:
        return MaterialPageRoute(
            settings: settings, builder: (_) => HellnHeaven());
        break;
      case ROUTE_Therion:
        return MaterialPageRoute(settings: settings, builder: (_) => Therion());
        break;
      case ROUTE_Aladdin:
        return MaterialPageRoute(settings: settings, builder: (_) => Aladdin());
        break;
      case ROUTE_ViveLatino:
        return MaterialPageRoute(
            settings: settings, builder: (_) => ViveLatino());
        break;
      case ROUTE_UserScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => UserScreen());
        break;
    }
  }
}
