import 'package:badges/badges.dart';
import 'package:e_commerce_app/cart.dart';
import 'package:e_commerce_app/favorites.dart';
import 'package:e_commerce_app/profile.dart';
import 'package:e_commerce_app/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Classes/count_cart.dart';
import 'Other Stuff/app_theme.dart';
import 'home.dart';

class AppSection extends StatefulWidget {
  const AppSection({Key key}) : super(key: key);

  @override
  _AppSectionState createState() => _AppSectionState();
}

class _AppSectionState extends State<AppSection> {
  int index = 0;
  SharedPreferences sharedPreferences;

  var tabList = [
    const HomePage(),
    const SearchPage(),
    const AddToCart(),
    const Favorite(),
    const ProfileUser(),
    // const AboutApp(),
  ];

  userSignedIn() async {
    sharedPreferences = await SharedPreferences.getInstance();

    String userStatus = sharedPreferences.get('uid') ?? "null";

    if (userStatus != "null") {
      return Badge(
        badgeColor: AppTheme.color,
        stackFit: StackFit.loose,
        badgeContent: Text(
          cartCounter.toString(),
          style: const TextStyle(color: Color(0xffffffff)),
        ),
        child: const FaIcon(FontAwesomeIcons.cartPlus),
      );
    }
    if (userStatus == "null") {
      return const FaIcon(FontAwesomeIcons.cartPlus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (index != 0) {
          setState(() {
            index = 0;
          });
        } else {
          SystemNavigator.pop(animated: true);
        }
        return null;
      },
      child: Scaffold(
        body: tabList[index],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          selectedItemColor: AppTheme.color,
          unselectedItemColor: Colors.grey,
          iconSize: 26,
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle:
              AppTheme.appBarStyle.copyWith(fontSize: 15, color: Colors.grey),
          selectedLabelStyle: AppTheme.appBarStyle
              .copyWith(fontSize: 15, color: AppTheme.color),
          showUnselectedLabels: false,
          elevation: 5,
          enableFeedback: true,
          items: [
            const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: FutureBuilder(
                future: userSignedIn(),
                builder: (context, s) {
                  if (s.data != null) {
                    return s.data;
                  } else {
                    return Container();
                  }
                },
              ),
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidHeart),
              label: 'Favorites',
            ),
            const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.userAlt),
              label: 'Profile',
            ),
          ],
          onTap: (i) {
            if (mounted) {
              setState(() {
                index = i;
              });
            }
          },
        ),
      ),
    );
  }
}
