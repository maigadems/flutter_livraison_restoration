import 'package:flutter/material.dart';

class  CardWidget  extends StatefulWidget {
  @override
  CardWidgetState createState() => CardWidgetState();

}

class CardWidgetState extends State<CardWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  GridView.builder(
      itemCount:6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
      itemBuilder: (BuildContext context , int index){
        return Card(
          color: Colors.red,
        );
      },
    );
  }
}