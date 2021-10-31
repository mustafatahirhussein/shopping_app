import 'package:e_commerce_app/Other%20Stuff/custom_appbar.dart';
import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: Customized.appBar("About App"),
      body: Center(
        child: Card(
          elevation: 7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Shopping App\nVersion 1.0\nby Mustafa Tahir",
              textAlign: TextAlign.center,
              style: style,
            ),
          ),
        ),
      ),
    );
  }
}
