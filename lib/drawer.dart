import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Other%20Stuff/text_fields.dart';
import 'package:e_commerce_app/about.dart';
import 'package:e_commerce_app/policy.dart';
import 'package:e_commerce_app/prev_orders.dart';
import 'package:e_commerce_app/sections.dart';
import 'package:e_commerce_app/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Other Stuff/app_btn.dart';
import 'Other Stuff/app_theme.dart';
import 'Other Stuff/route_and_message.dart';
import 'login.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  SharedPreferences sharedPreferences;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  var address = TextEditingController();

  getCurrentUser() async {
    var style = AppTheme.splashStyle.copyWith(
        color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold);

    sharedPreferences = await SharedPreferences.getInstance();

    String userID = sharedPreferences.getString("uid") ?? "null";

    //Document ID
    String colID = sharedPreferences.getString("col_id");

    if (userID != "null") {
      return StreamBuilder(
        stream:
            firebaseFirestore.collection("Customers").doc(colID).snapshots(),
        builder: (context, s) {
          if (s.hasData) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              child: Drawer(
                child: DrawerHeader(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(color: Colors.grey[100]),
                  curve: Curves.easeInBack,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Center(
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: s.data["image"].isEmpty
                                ? "https://www.wpclipart.com/people/faces/anonymous/photo_not_available_BW.png"
                                : s.data["image"],
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                            placeholder: (context, _) =>
                                AppTheme.loader(const Color(0xff0588BC)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        s.data["username"],
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                            fontSize: 22, fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ListTile(
                        leading: const FaIcon(
                          FontAwesomeIcons.shoppingBasket,
                        ),
                        title: const Text("Previous Orders"),
                        trailing: const FaIcon(FontAwesomeIcons.chevronRight),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const RecentOrders()));
                        },
                      ),
                      ListTile(
                        leading: const FaIcon(
                            FontAwesomeIcons.edit
                        ),
                        title: const Text("Modify Address"),
                        trailing: const FaIcon(FontAwesomeIcons.chevronRight),

                        onTap: () {
                          Navigator.pop(context);
                          editAddress(context);
                        },
                      ),
                      ListTile(
                        leading: const FaIcon(
                            FontAwesomeIcons.info
                        ),
                        title: const Text("About App"),
                        trailing: const FaIcon(FontAwesomeIcons.chevronRight),

                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AboutApp()));
                        },
                      ),
                      ListTile(
                        leading: const FaIcon(
                            FontAwesomeIcons.file
                        ),
                        title: const Text("Policy"),
                        trailing: const FaIcon(FontAwesomeIcons.chevronRight),

                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Policy()));
                        },
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppButton(
                          onPressed: () async {
                            sharedPreferences =
                                await SharedPreferences.getInstance();

                            sharedPreferences.remove("uid");
                            await auth.signOut();

                            RouteMsg.msg("Signed Out Successfully!");

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AppSection()),
                                (route) => false);
                          },
                          text: "LogOut",
                          icon: FontAwesomeIcons.signOutAlt,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return AppTheme.loader(const Color(0xff0588BC));
        },
      );
    }
    if (userID == "null") {
      return Drawer(
        child: DrawerHeader(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(color: Colors.grey[100]),
          curve: Curves.easeInBack,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
            child: ListView(
              children: [
                Text(
                  "Shopping App",
                  textAlign: TextAlign.center,
                  style: style,
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AppButton(
                    onPressed: () {
                      Navigator.pop(context);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Login()));
                    },
                    text: "Sign in",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AppButton(
                    onPressed: () {
                      Navigator.pop(context);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUp()));
                    },
                    text: "Sign Up",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Flutter Final Hackathon",
                  textAlign: TextAlign.center,
                  style:
                      style.copyWith(fontSize: 22, fontStyle: FontStyle.italic),
                ),
                Text(
                  "By: Mustafa Tahir",
                  textAlign: TextAlign.center,
                  style:
                      style.copyWith(fontSize: 12, fontStyle: FontStyle.normal),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  editAddress(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Address"),
              content: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Field.formField(
                      address, "Address", TextInputType.streetAddress),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AppButton(
                      text: "Update",
                      onPressed: () {
                        updateAddress();
                      },
                    ),
                  ),
                ],
              ),
            ));
  }

  updateAddress() async {
    sharedPreferences = await SharedPreferences.getInstance();

    String colID = sharedPreferences.getString("col_id");

    Map<String, dynamic> update = {
      "address": address.text,
    };

    firebaseFirestore.collection("Customers").doc(colID).update(update);

    RouteMsg.msg("Address modified successfully!");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCurrentUser(),
        builder: (context, s) {
          if (s.data != null) {
            return s.data;
          }
          return Container();
        });
  }
}
