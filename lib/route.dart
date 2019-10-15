import 'package:flutter/material.dart';
import 'package:pengkolan/screens/Login/index.dart';
import 'package:pengkolan/screens/SignUp/index.dart';
import 'package:pengkolan/screens/Home/index.dart';
import 'package:pengkolan/theme/style.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    "/SignUp": (BuildContext context) => new SignUpScreen(),
    "/HomePage": (BuildContext context) => new HomeScreen()
  };

  Routes() {
    runApp(new MaterialApp(
      title: "Pengkolan",
      home: new LoginScreen(),
      theme: appTheme,
      routes: routes,
      debugShowCheckedModeBanner: false,
    ));
  }
}
