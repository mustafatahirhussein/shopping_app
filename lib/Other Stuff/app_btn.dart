import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final IconData icon;

  const AppButton({Key key, this.onPressed, this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xff0588BC),
            border: Border.all(color: const Color(0xffffffff)),
            borderRadius: const BorderRadius.all(Radius.circular(14))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: icon == null
              ? Text(text,
                  textAlign: TextAlign.center,
                  style: AppTheme.btnStyle.copyWith(fontSize: 20))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 30,
                      color: const Color(0xffffffff),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(text,
                        textAlign: TextAlign.center,
                        style: AppTheme.btnStyle.copyWith(fontSize: 20)),
                  ],
                ),
        ),
      ),
    );
  }
}
