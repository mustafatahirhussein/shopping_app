import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Classes/random_items.dart';
import 'package:e_commerce_app/Other%20Stuff/custom_appbar.dart';
import 'package:e_commerce_app/drawer.dart';
import 'package:flutter/material.dart';

import 'Classes/categories.dart';
import 'Other Stuff/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _item = [
    Categories(
      name: "Electronics",
      image: "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg"
    ),
    Categories(
        name: "Car",
        image: "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg"
    ),
    Categories(
        name: "Mobile",
        image: "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg"
    ),
    Categories(
        name: "Clothes",
        image: "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg"
    ),
    Categories(
        name: "Groceries",
        image: "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg"
    ),
    Categories(
        name: "Hardware",
        image: "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg"
    ),
  ];

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
      drawer: const AppDrawer(),
      appBar: Customized.appBar("Home"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Categories"),
          SizedBox(
            height: 170,
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _item.length,
              itemBuilder: (context,i) {

                return Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: _item[i].image ??
                          "https://www.wpclipart.com/people/faces/anonymous/photo_not_available_BW.png",
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                      placeholder: (context, _) =>
                          AppTheme.loader(const Color(0xff0588BC)),
                    ),
                    Text(_item[i].name),
                  ],
                );

              },
            ),
          ),
          Text("Flash Sale"),
          SizedBox(
            height: 170,
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _item.length,
              itemBuilder: (context,i) {

                return Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: _item[i].image ??
                          "https://www.wpclipart.com/people/faces/anonymous/photo_not_available_BW.png",
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                      placeholder: (context, _) =>
                          AppTheme.loader(const Color(0xff0588BC)),
                    ),
                    Text(_item[i].name),
                  ],
                );

              },
            ),
          ),

          Text("Just for you"),
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
