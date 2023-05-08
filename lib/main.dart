import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:tokosmile/config/constants.dart';
import 'package:tokosmile/screens/home/home_page.dart';
import 'package:tokosmile/screens/product/product_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      debugShowCheckedModeBanner: false,
      //themeMode: ThemeMode.dark,//controller.mode,
      //theme: AppTheme.lightTheme,
      //darkTheme: AppTheme.darkTheme,
      title: 'Tokosmile App',
      theme: ThemeData(
          fontFamily: "Jost",
          primaryColor: primaryColor,
          primarySwatch: createMaterialColor(blackColor)),
      home: const HomePage(),
    );
  }
}
