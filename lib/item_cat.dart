import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Other%20Stuff/custom_appbar.dart';
import 'package:e_commerce_app/product_desc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Classes/count_cart.dart';
import 'Classes/favorites_class.dart';
import 'Classes/random_items.dart';
import 'Other Stuff/app_theme.dart';

class ItemCat extends StatefulWidget {
  final String cat;

  const ItemCat({Key key, this.cat}) : super(key: key);

  @override
  _ItemCatState createState() => _ItemCatState();
}

class _ItemCatState extends State<ItemCat> {
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
      appBar: Customized.appBar("Item Category : ${widget.cat}"),
      body: GridView.builder(
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
    );
  }
}
