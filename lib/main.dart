import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:future_movie/screen/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
  RenderErrorBox.backgroundColor = Colors.black;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen(),
    );
  }
}

