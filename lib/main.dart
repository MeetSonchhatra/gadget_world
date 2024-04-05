import 'package:gadget_world/core/store.dart';
import 'package:gadget_world/pages/cart_page.dart';
import 'package:gadget_world/pages/login_page.dart';
import 'package:gadget_world/utils/routes.dart';
import 'package:gadget_world/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'pages/home_page.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lighttheme(context),
      darkTheme: MyTheme.darktheme(context),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeroute: (context) => HomePage(),
        MyRoutes.loginroute: (context) => LoginPage(),
        MyRoutes.cartroute: (context) => CartPage()
      },
    );
  }
}
