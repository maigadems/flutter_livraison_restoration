import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color:  Colors.white,
      child: Center(
        child: SpinKitRipple(
          color : Colors.red,
          size: 400,
          borderWidth: 30,
          duration: Duration(milliseconds: 2000),
        ),
      ),
    );
  }
}