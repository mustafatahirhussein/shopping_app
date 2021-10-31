import 'package:e_commerce_app/Other%20Stuff/text_fields.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

class Customized{

  static AppBar appBar(String title) {
    return  AppBar(
      backgroundColor: AppTheme.color,
      centerTitle: true,
      title: Text(
        title,
        style: AppTheme.appBarStyle,
      ),
    );
  }
}