import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cart_controller.dart';
import 'cart_product.dart';
import 'cart_total.dart';

class CartScreen extends StatefulWidget {
  final cartController = Get.put(CartController());
  final CartController controller = Get.find();


  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    if ( widget.controller.nombre_element == 0) {
      return Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.remove_shopping_cart,
                  size: 250,
                  color: Color.fromRGBO(232, 83, 83, 1),
                ),
                Text('Votre panier est vide',
                  style: GoogleFonts.vibes(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(232, 83, 83, 1),
                  ),
                )

              ],
            ),
          )
        ),
      );
    }
    return Obx(() => Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          child:  Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '${widget.controller.nombre_element} plats in card',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(30, 9, 95, 1)
                      ),
                    ),
                    Icon(Icons.shopping_cart,
                      size: 40,
                      color: Color.fromRGBO(119, 6,6, 1),
                    )
                  ],
                ),
              ),
              CartProduct(),
              CartTotal(),
            ],
          ),
        ),
      )
    ),
    );
  }
}
