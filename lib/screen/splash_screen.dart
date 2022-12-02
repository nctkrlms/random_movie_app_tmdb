import 'package:flutter/material.dart';
import 'package:future_movie/screen/movie_screen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';


class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      backgroundImage: Image.asset(
          'assets/images/finderLogo.png',fit: BoxFit.fill,).image,
      title: Text(
        "",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: Text("Loading..."),
      navigator: FutureBuilderMovie(),
      durationInSeconds: 10,
    );
  }
}
