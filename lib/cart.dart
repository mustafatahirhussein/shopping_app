import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Classes/count_cart.dart';
import 'package:e_commerce_app/Other%20Stuff/custom_appbar.dart';
import 'package:e_commerce_app/product_desc.dart';
import 'package:e_commerce_app/sections.dart';
import 'package:e_commerce_app/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Classes/favorites_class.dart';
import 'Classes/order_class.dart';
import 'Classes/random_items.dart';
import 'Other Stuff/app_btn.dart';
import 'Other Stuff/app_theme.dart';
import 'Other Stuff/route_and_message.dart';
import 'login.dart';

class AddToCart extends StatefulWidget {
  final RandomItems product;

  const AddToCart({Key key, this.product}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  SharedPreferences sharedPreferences;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  final _randomItems = [
    RandomItems(
      name: "HP Laptop x464",
      image:
          "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
      price: "Rs. 80,400",
      category: "Laptop",
      discount: "35%",
    ),
    RandomItems(
      name: "HP Laptop x464",
      image:
          "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
      price: "Rs. 80,400",
      category: "Laptop",
      discount: "35%",
    ),
    RandomItems(
      name: "HP Laptop x464",
      image:
          "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
      price: "Rs. 80,400",
      category: "Laptop",
      discount: "35%",
    ),
    RandomItems(
      name: "HP Laptop x464",
      image:
          "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
      price: "Rs. 80,400",
      category: "Laptop",
      discount: "35%",
    ),
    RandomItems(
      name: "HP Laptop x464",
      image:
          "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
      price: "Rs. 80,400",
      category: "Laptop",
      discount: "35%",
    ),
    RandomItems(
      name: "HP Laptop x464",
      image:
          "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
      price: "Rs. 80,400",
      category: "Laptop",
      discount: "35%",
    ),
  ];

  getCurrentUser() async {
    var style = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    var pStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    sharedPreferences = await SharedPreferences.getInstance();

    String userID = sharedPreferences.getString("uid") ?? "null";

    //Document ID
    String colID = sharedPreferences.getString("col_id");

    if (userID != "null") {
      return Padding(
        padding: const EdgeInsets.all(1.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cart.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: cart.length,
                    itemBuilder: (context, i) {
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        key: UniqueKey(),
                        onDismissed: (_) {
                          setState(() {
                            cartCounter--;
                          });

                          cart.removeAt(i);
                        },
                        background: Container(
                          color: Colors.red,
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: FaIcon(
                                FontAwesomeIcons.trash,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        child: Card(
                          child: ListTile(
                            leading: CachedNetworkImage(
                              imageUrl: cart[i].image ??
                                  "https://www.wpclipart.com/people/faces/anonymous/photo_not_available_BW.png",
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                              placeholder: (context, _) =>
                                  AppTheme.loader(const Color(0xff0588BC)),
                            ),
                            title: Text(
                              cart[i].item,
                              style: style,
                            ),
                            subtitle: Text(
                              cart[i].price,
                              style: pStyle.copyWith(color: Colors.red),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Qty\t\t ",
                                  style: pStyle,
                                ),
                                InkWell(
                                  child:
                                      const FaIcon(FontAwesomeIcons.plusCircle),
                                  onTap: () {
                                    setState(() {
                                      int val = int.parse(cart[i].qty);

                                      val++;

                                      cart[i].qty = val.toString();
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  cart[i].qty,
                                  style: style,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  child: const FaIcon(
                                      FontAwesomeIcons.minusCircle),
                                  onTap: () {
                                    setState(() {
                                      int val = int.parse(cart[i].qty);

                                      val--;

                                      cart[i].qty = val.toString();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Center(
                        child: Text(
                      "No Items in Cart",
                      style: style,
                    )),
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                "Also Checkout these Products",
                style: pStyle,
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: _randomItems.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDesc(
                                product: _randomItems[i],
                              )));
                    },
                    child: Card(
                      child: Wrap(
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            clipBehavior: Clip.none,
                            children: [
                              CachedNetworkImage(
                                imageUrl: _randomItems[i].image ??
                                    "https://www.wpclipart.com/people/faces/anonymous/photo_not_available_BW.png",
                                fit: BoxFit.cover,
                                height: 150,
                                width: double.infinity,
                                placeholder: (context, _) =>
                                    AppTheme.loader(const Color(0xff0588BC)),
                              ),
                              Positioned(
                                  top: 5,
                                  right: 5,
                                  child: InkWell(
                                      onTap: () {
                                        fav.add(Fav(
                                          image: _randomItems[i].image,
                                          price: _randomItems[i].price,
                                          item: _randomItems[i].name,
                                          discount: _randomItems[i].discount,
                                        ));
                                      },
                                      child: const FaIcon(
                                        FontAwesomeIcons.solidHeart,
                                        size: 28,
                                        color: Color(0xff0588BC),
                                      ))),
                            ],
                          ),
                          ListTile(
                            dense: true,
                            contentPadding: const EdgeInsets.all(3),
                            leading: Text(
                              _randomItems[i].name,
                              style: style.copyWith(fontSize: 15),
                            ),
                            trailing: Text(
                              _randomItems[i].price +
                                  "\n" +
                                  _randomItems[i].discount +
                                  " OFF",
                              style: pStyle.copyWith(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
    if (userID == "null") {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login or Sign Up to add Item in your Cart",
              style: pStyle,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: AppButton(
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                text: "Sign in",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: AppButton(
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                text: "Sign Up",
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    var pStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: Customized.appBar("Add To Cart"),
      body: FutureBuilder(
          future: getCurrentUser(),
          builder: (context, s) {
            if (s.data != null) {
              return s.data;
            }
            return Container();
          }),
      floatingActionButton: cart.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton.extended(
                    onPressed: () {
                      orders.add(Orders(
                          image: widget.product.image,
                          price: widget.product.price,
                          item: widget.product.name,
                          qty: "1"));

                      RouteMsg.msg("Checkout successfully!");

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const AppSection()),
                          (Route<dynamic> route) => false);
                    },
                    backgroundColor: AppTheme.color,
                    icon: const Text("Buy Item"),
                    label: const FaIcon(FontAwesomeIcons.shoppingCart),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {},
                    backgroundColor: AppTheme.color,
                    icon: const Text("Edit Product"),
                    label: const FaIcon(FontAwesomeIcons.edit),
                  ),
                ],
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
