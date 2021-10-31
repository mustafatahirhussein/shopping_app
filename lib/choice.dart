import 'package:e_commerce_app/sections.dart';
import 'package:e_commerce_app/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Other Stuff/app_btn.dart';
import 'Other Stuff/app_theme.dart';
import 'Other Stuff/custom_appbar.dart';
import 'login.dart';

class Choice extends StatelessWidget {
  const Choice({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customized.appBar("What do you want to do?"),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AppButton(
                        text: "Sign Up",
                        onPressed: () {
                          saveBool();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()),
                              (Route<dynamic> route) => false);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AppButton(
                        text: "Sign In",
                        onPressed: () {
                          saveBool();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                              (Route<dynamic> route) => false);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          saveBool();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const AppSection()),
              (Route<dynamic> route) => false);
        },
        backgroundColor: AppTheme.color,
        icon: const Text("Skip"),
        label: const FaIcon(FontAwesomeIcons.arrowRight),
      ),
    );
  }

  saveBool() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setBool("did_choice", true);
  }
}
