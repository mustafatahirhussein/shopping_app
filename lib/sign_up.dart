import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Other%20Stuff/custom_appbar.dart';
import 'package:e_commerce_app/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;

import 'Other Stuff/app_btn.dart';
import 'Other Stuff/app_theme.dart';
import 'Other Stuff/route_and_message.dart';
import 'Other Stuff/text_fields.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var email = TextEditingController();
  var pass = TextEditingController();

  var fullName = TextEditingController();
  var address = TextEditingController();
  var cnt = TextEditingController();

  String paymentOpt = "Cash";
  var items = ["Cash", "Credit", "Debit", "Cheque"];

  File image;
  bool _isVisible = true;

  final _formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential userCredential;
  SharedPreferences sharedPreferences;

  String url = "";

  loadImage(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AppButton(
                      text: "Pictures",
                      onPressed: () async {
                        var picker = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);

                        if (picker.path.isNotEmpty) {
                          setState(() {
                            image = File(picker.path);
                          });
                          Navigator.pop(context);

                          String fileName = path.basename(image.path);

                          Reference firebaseStorageRef =
                              FirebaseStorage.instance.ref().child(fileName);

                          UploadTask uploadTask =
                              firebaseStorageRef.putFile(image);
                          TaskSnapshot taskSnapshot = await uploadTask;
                          url = await firebaseStorageRef.getDownloadURL();

                          setState(() {});
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AppButton(
                      text: "Camera",
                      onPressed: () async {
                        var picker = await ImagePicker()
                            .pickImage(source: ImageSource.camera);

                        if (picker.path.isNotEmpty) {
                          setState(() {
                            image = File(picker.path);
                          });
                          Navigator.pop(context);

                          String fileName = path.basename(image.path);

                          Reference firebaseStorageRef =
                              FirebaseStorage.instance.ref().child(fileName);

                          UploadTask uploadTask =
                              firebaseStorageRef.putFile(image);
                          TaskSnapshot taskSnapshot = await uploadTask;
                          url = await firebaseStorageRef.getDownloadURL();

                          setState(() {});
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customized.appBar("Sign Up"),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  image == null
                      ? InkWell(
                          onTap: () {
                            loadImage(context);
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xff0588BC),
                                border: Border.all(
                                    color: const Color(0xffffffff), width: 1)),
                            child: Center(
                                child: Text(
                              "Add \nPicture",
                              textAlign: TextAlign.center,
                              style: AppTheme.btnStyle,
                            )),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            loadImage(context);
                          },
                          child: ClipOval(
                            child: Image.file(
                              image,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Field.formField(
                    fullName,
                    "Full Name",
                    TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Field.formField(
                    email,
                    "Email",
                    TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Field.formFieldWithPass(pass, "Password", toggle, _isVisible),
                  const SizedBox(
                    height: 20,
                  ),
                  Field.formField(
                    address,
                    "Address",
                    TextInputType.streetAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Field.formField(
                    cnt,
                    "Contact",
                    TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff0588BC)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: DropdownButton(
                      icon: const FaIcon(FontAwesomeIcons.chevronDown,color: Color(0xff0588BC),),
                      iconSize: 10,
                      underline: Container(),
                      selectedItemBuilder: (BuildContext context) {
                        return items.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: AppTheme.splashStyle.copyWith(fontSize: 15),
                            ),
                          );
                        }).toList();
                      },
                      iconEnabledColor: const Color(0xffffffff),
                      value: paymentOpt,
                      items: items.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style:
                                AppTheme.btnStyle.copyWith(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          paymentOpt = val;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AppButton(
                      text: "Sign Up",
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          try {
                            userCredential =
                                await auth.createUserWithEmailAndPassword(
                                    email: email.text, password: pass.text);

                            if (userCredential.user != null) {
                              createUser(userCredential.user.uid);

                              RouteMsg.msg("Signed Successfully!");
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              debugPrint('The password provided is too weak.');

                              RouteMsg.msg("Password is weak");
                            } else if (e.code == 'email-already-in-use') {
                              debugPrint(
                                  'The account already exists for that email.');

                              RouteMsg.msg("User already exists");
                            }
                          } catch (e) {
                            debugPrint(e);
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createUser(String uid) async {
    Map<String, dynamic> data = {
      "username": fullName.text,
      "email": email.text,
      "address": address.text,
      "cnt": cnt.text,
      "payment": paymentOpt,
      "image": url,
    };
    FirebaseFirestore.instance.collection("Customers").doc(uid).set(data);

    sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString("col_id", uid);

    if (data == null) {
      debugPrint('Email is not valid');
    } else {
      debugPrint(data.toString());

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Login()),
          (Route<dynamic> route) => false);
    }
  }

  toggle() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
}
