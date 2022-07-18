/*import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/test/product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'cart_controller.dart';


class CatalogProductCard extends StatefulWidget {

  final cartController = Get.put(CartController());
  final int index;
  CatalogProductCard({Key? key,
    required this.index
  }) : super(key: key);

  @override
  State<CatalogProductCard> createState() => _CatalogProductCardState();
}

class _CatalogProductCardState extends State<CatalogProductCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              Product.products[widget.index].photo,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              Product.products[widget.index].nomPlat,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Text('${Product.products[widget.index].prixPlat}'),
          ),
          IconButton(
            onPressed: () {
              widget.cartController.addProduct(Product.products[widget.index]);
            },
            icon: Icon(
              Icons.add_circle,
            ),
          ),
        ],
      ),
    );
  }
}
*/
