import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Classes/count_cart.dart';
import 'package:e_commerce_app/Other%20Stuff/custom_appbar.dart';
import 'package:e_commerce_app/cart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Classes/cart_class.dart';
import 'Classes/random_items.dart';
import 'Other Stuff/app_theme.dart';
import 'Other Stuff/route_and_message.dart';

class Favorite extends StatefulWidget {
  final RandomItems product;

  const Favorite({Key key, this.product}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
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
      appBar: Customized.appBar("Favorites"),
      body: fav.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: fav.length,
              itemBuilder: (context, i) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  key: UniqueKey(),
                  onDismissed: (_) {
                    fav.removeAt(i);
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
                    elevation: 4,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),

                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: fav[i].image ??
                              "https://www.wpclipart.com/people/faces/anonymous/photo_not_available_BW.png",
                          fit: BoxFit.cover,
                          height: 180,
                          width: double.infinity,
                          placeholder: (context, _) =>
                              AppTheme.loader(const Color(0xff0588BC)),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(fav[i].item,style: style,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(fav[i].price,style: pStyle.copyWith(color: Colors.red),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text("Discount "+fav[i].discount,style: pStyle,),
                        ),

                         Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",textAlign: TextAlign.justify,style: pStyle,),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton.icon(
                            onPressed: () {

                              cart.add(Cart(
                                  image: fav[i].image,
                                  price: fav[i].price,
                                  item: fav[i].item,
                                  qty: "1"
                              ));
                              setState(() {
                                cartCounter++;
                              });

                              RouteMsg.msg("Added to Cart successfully!");


                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AddToCart(product: widget.product)));
                            },
                            color: AppTheme.color,
                            icon:  Text("Add to Cart",style: pStyle.copyWith(color: Colors.white),),
                            label: const FaIcon(FontAwesomeIcons.cartPlus,color: Colors.white,),
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              },
            )
          :  Center(child: Text("No Favorites",style: style,)),
    );
  }
}
