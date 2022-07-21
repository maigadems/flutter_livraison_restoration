import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/accueil.dart';
import 'package:flutter_livraison_restoration/simple_map_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cart_controller.dart';
import 'cart_screen.dart';

class CartTotal extends StatefulWidget {

  final CartController controller = Get.find();

  CartTotal({Key? key}) : super(key: key);

  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    if (widget.controller.products.length == 0)
    {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total : ',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '00.00Fr',
              style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(204, 172, 5, 1)
              ),
            ),
          ],
        ),
      );
    }
    else {
      return Obx(
            () =>
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              //width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total : ',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.controller.total} Fr',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(204, 172, 5, 1)
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding:EdgeInsets.only(top: 15 , bottom: 20),
                      child:   FlatButton(
                        onPressed: () => Get.to(() => SimpleMapScreen()),
                        color: Color.fromRGBO(232, 83, 83, 1),
                        child:Padding(
                          padding: EdgeInsets.only(top: 18,bottom: 18),
                          child: Text("Commander",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,

                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ) ,
                    ),
                  ],
                )
            ),
      );
    }
  }
}
