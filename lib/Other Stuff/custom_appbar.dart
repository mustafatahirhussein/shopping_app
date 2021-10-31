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