import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Classes/count_cart.dart';
import 'package:e_commerce_app/Other%20Stuff/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Classes/order_class.dart';
import 'Classes/random_items.dart';
import 'Other Stuff/app_theme.dart';

class AddToCart extends StatefulWidget {
  final RandomItems product;

  const AddToCart({Key key, this.product}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _randomItems = [
    RandomItems(
        name: "HP Laptop x464",
        image:
            "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price: "Rs. 80,400",
        category: "Laptop"),
    RandomItems(
        name: "HP Laptop x464",
        image:
            "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price: "Rs. 80,400",
        category: "Laptop"),
    RandomItems(
        name: "HP Laptop x464",
        image:
            "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price: "Rs. 80,400",
        category: "Laptop"),
    RandomItems(
        name: "HP Laptop x464",
        image:
            "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price: "Rs. 80,400",
        category: "Laptop"),
    RandomItems(
        name: "HP Laptop x464",
        image:
            "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price: "Rs. 80,400",
        category: "Laptop"),
    RandomItems(
        name: "HP Laptop x464",
        image:
            "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price: "Rs. 80,400",
        category: "Laptop"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customized.appBar("Add To Cart"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          cart.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: cart.length,
                  itemBuilder: (context, i) {
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      key: UniqueKey(),
                      onDismissed: (val) {
                        setState(() {
                          cartCounter - 1;
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
                          title: Text(cart[i].item),
                          subtitle: Text(cart[i].price),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text("Qty\t\t "),
                              InkWell(
                                child: const FaIcon(FontAwesomeIcons.plusCircle),
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
                              Text(cart[i].qty),
                              const SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                child: const FaIcon(FontAwesomeIcons.minusCircle),
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
              : const SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Center(child: Text("No Items in Cart")),
                ),
          const Text("Also Checkout these Products"),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: _randomItems.length,
              itemBuilder: (context, i) {
                return Card(
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: _randomItems[i].image ??
                            "https://www.wpclipart.com/people/faces/anonymous/photo_not_available_BW.png",
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                        placeholder: (context, _) =>
                            AppTheme.loader(const Color(0xff0588BC)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_randomItems[i].name),
                          Text(_randomItems[i].price),
                        ],
                      ),
                      Text(_randomItems[i].category),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton:   cart.isNotEmpty ? Padding(
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
                    qty: "1"
                ));

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
      ) : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
