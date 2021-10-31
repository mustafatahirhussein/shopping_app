import 'dart:async';
import 'package:e_commerce_app/choice.dart';
import 'package:e_commerce_app/sections.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Other Stuff/app_theme.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Duration duration = const Duration(seconds: 4);
  SharedPreferences sharedPreferences;

  runSplash(BuildContext context) async {
    sharedPreferences = await SharedPreferences.getInstance();

    bool check = sharedPreferences.get("did_choice") ?? false;

    Timer.periodic(duration, (timer) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) =>
              check ? const AppSection() : const Choice()),
              (Route<dynamic> route) => false);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    runSplash(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff260666),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/ecom.jpg",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                textAlign: TextAlign.center
              ,text: TextSpan(children: [
                TextSpan(
                  text: "E-Commerce Shop",style: AppTheme.splashStyle.copyWith(fontSize: 25)
                ),
                TextSpan(
                    text: "\nYour Shopping partner",style: AppTheme.splashStyle.copyWith(fontSize: 18)
                ),
              ],)),

              const SizedBox(
                height: 30,
              ),
              AppTheme.loader(const Color(0xff0588BC)),
            ],
          ),
        ),
      ),
    );
  }
}
