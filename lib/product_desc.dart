import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Classes/count_cart.dart';
import 'package:e_commerce_app/Classes/random_items.dart';
import 'package:e_commerce_app/Other%20Stuff/custom_appbar.dart';
import 'package:e_commerce_app/cart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Classes/cart_class.dart';
import 'Other Stuff/app_theme.dart';

class ProductDesc extends StatefulWidget {
  final RandomItems product;

  const ProductDesc({Key key, this.product}) : super(key: key);

  @override
  _ProductDescState createState() => _ProductDescState();
}

class _ProductDescState extends State<ProductDesc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customized.appBar("Product Description"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.product.image ??
                  "https://www.wpclipart.com/people/faces/anonymous/photo_not_available_BW.png",
              width: double.infinity,
              height: 270,
              fit: BoxFit.cover,
              placeholder: (context, _) =>
                  AppTheme.loader(const Color(0xff0588BC)),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                widget.product.name,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(3.0),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                widget.product.price,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
               "Discount "+ widget.product.discount,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(3.0),
              child: Text(
                "Now\nRs. 68,900",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.extended(
          onPressed: () {

            cart.add(Cart(
              image: widget.product.image,
              price: widget.product.price,
              item: widget.product.name,
              qty: "1"
            ));
            setState(() {
              cartCounter++;
            });


            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddToCart(product: widget.product)));
          },
          backgroundColor: AppTheme.color,
          icon: const Text("Add to Cart"),
          label: const FaIcon(FontAwesomeIcons.cartPlus),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
