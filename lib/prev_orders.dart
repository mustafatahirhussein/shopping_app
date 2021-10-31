import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Classes/count_cart.dart';
import 'package:e_commerce_app/Other%20Stuff/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'Other Stuff/app_theme.dart';

class RecentOrders extends StatefulWidget {
  const RecentOrders({Key key}) : super(key: key);

  @override
  _RecentOrdersState createState() => _RecentOrdersState();
}

class _RecentOrdersState extends State<RecentOrders> {
  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );

    var pStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: Customized.appBar("Previous Orders"),
      body: orders.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: orders.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: orders[i].image ??
                          "https://www.wpclipart.com/people/faces/anonymous/photo_not_available_BW.png",
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                      placeholder: (context, _) =>
                          AppTheme.loader(const Color(0xff0588BC)),
                    ),
                    title: Text(orders[i].item,style: style,),
                    subtitle: Text(orders[i].price,style: pStyle.copyWith(color: Colors.red),),
                  ),
                );
              },
            )
          : Center(
              child: Text(
              "Shop to add items to Orders",
              style: pStyle,
            )),
    );
  }
}
