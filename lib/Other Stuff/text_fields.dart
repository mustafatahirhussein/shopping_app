import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_theme.dart';

class Field {
  static Widget formField(TextEditingController controller, String label,
      TextInputType textInputType) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      cursorColor: const Color(0xff0588BC),
      style: AppTheme.splashStyle.copyWith(fontSize: 15),
      decoration: InputDecoration(
        errorStyle: AppTheme.splashStyle.copyWith(fontSize: 14),
        labelText: label,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff0588BC), width: 1.0),
        ),
        labelStyle: AppTheme.splashStyle.copyWith(fontSize: 14),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      validator: (val) => val.isEmpty ? "Empty" : null,
    );
  }

  static Widget formFieldWithPass(TextEditingController controller,
      String label, Function onTap, bool visible) {
    return TextFormField(
      controller: controller,
      obscureText: visible,
      cursorColor: const Color(0xff0588BC),
      style: AppTheme.splashStyle.copyWith(fontSize: 15),
      decoration: InputDecoration(
        errorStyle: AppTheme.splashStyle.copyWith(fontSize: 14),
        labelText: label,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff0588BC), width: 1.0),
        ),
        labelStyle: AppTheme.splashStyle.copyWith(fontSize: 14),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        suffixIcon: InkWell(
          child: Icon(
            visible ? Icons.visibility_off : Icons.visibility,
            color: const Color(0xff0588BC),
          ),
          onTap: onTap,
        ),
      ),
      validator: (val) => val.isEmpty ? "Empty" : null,
    );
  }
}
