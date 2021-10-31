import 'package:e_commerce_app/Other%20Stuff/custom_appbar.dart';
import 'package:flutter/material.dart';

class Policy extends StatelessWidget {
  const Policy({Key key}) : super(key: key);

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
      appBar: Customized.appBar("App Policy"),
      body:  Center(
        child: Card(
          elevation: 7,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Shop App Policy\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",textAlign: TextAlign.center,style: pStyle,),
          ),
        ),
      ),
    );
  }
}
