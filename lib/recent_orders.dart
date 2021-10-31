import 'package:flutter/material.dart';

class RecentOrders extends StatefulWidget {
  const RecentOrders({Key key}) : super(key: key);

  @override
  _RecentOrdersState createState() => _RecentOrdersState();
}

class _RecentOrdersState extends State<RecentOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Recent Orders"),
      ),
      body: Center(
        child: Text("Orders"),
      ),
    );
  }
}
