import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'cart_controller.dart';
import 'cart_product_card.dart';

class CartProduct extends StatefulWidget {
  final CartController controller = Get.find();

  CartProduct({Key? key}) : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Obx(() =>
      Container(
        width: size.width,
      height: size.height/1.4,
      //height:400,
      child: ListView.builder(
          itemCount: widget.controller.products.length,
          itemBuilder: (BuildContext context, int index) {
            return CartProductCard(
              controller: widget.controller,
              product: widget.controller.products.keys.toList()[index],
              quantity: widget.controller.products.values.toList()[index],
              index: index,
            );
          }),
      )
    );
  }
}
