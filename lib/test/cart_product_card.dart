import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/gestion_donnees/plats.dart';
import 'package:flutter_livraison_restoration/test/product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cart_controller.dart';

class CartProductCard extends StatefulWidget {
  final CartController controllere = Get.find();


  final CartController controller;
  final Plats product;
  final int quantity;
  final int index;

   CartProductCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,
  }) : super(key: key);


  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

      return  Padding(
        padding: EdgeInsets.only(left: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: size.width / 3.5,
              height: size.width / 4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(229, 229, 229, 1)
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  widget.product.photo,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.product.nomPlat,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text('${widget.product.prixPlat.toString()} Fr',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(204, 172, 5, 1)
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        widget.controller.removeProduct(widget.product);
                        widget.controller.rafraichir(context);
                      },
                      icon: Icon(Icons.remove_circle_outline,
                        color: Colors.red,
                        size: 27,
                      ),
                    ),
                    Text('${widget.quantity}',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        widget.controller.addProduct(widget.product);
                      },
                      icon: Icon(Icons.add_circle_outline,
                        color: Colors.redAccent,
                        size: 27,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  widget.controller.remove(widget.product);
                  widget.controller.rafraichir(context);
                },
                icon: Icon(Icons.cancel,
                    color: Colors.redAccent
                )
            )
          ],
        ),
      );
    }
}
