import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'Classes/random_items.dart';
import 'Other Stuff/app_theme.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key key}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {


  final _randomItems = [
    RandomItems(
        name: "HP Laptop x464",
        image: "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price:"Rs. 80,400",
        category: "Laptop"
    ),
    RandomItems(
        name: "HP Laptop x464",
        image: "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price:"Rs. 80,400",
        category: "Laptop"
    ),
    RandomItems(
        name: "HP Laptop x464",
        image: "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price:"Rs. 80,400",
        category: "Laptop"
    ),
    RandomItems(
        name: "HP Laptop x464",
        image: "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price:"Rs. 80,400",
        category: "Laptop"
    ),
    RandomItems(
        name: "HP Laptop x464",
        image: "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price:"Rs. 80,400",
        category: "Laptop"
    ),
    RandomItems(
        name: "HP Laptop x464",
        image: "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price:"Rs. 80,400",
        category: "Laptop"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add To Cart"),
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            const SizedBox(
              width: double.infinity,
              height: 300,
              child: Center(child: Text("No Items in Cart")),
            ),


            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: _randomItems.length,
                itemBuilder: (context,i) {
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
        )
    );
  }
}
