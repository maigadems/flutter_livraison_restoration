import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/gestion_donnees/plats.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // Add a dict to store the products in the cart.
  var _products = {}.obs;

  void addProduct(Plats product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }



    Get.snackbar(
      "${product.nomPlat} a ete ajoute avec succes",
      "Congrats",
      colorText: Colors.white,
      margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(5),
        snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),
      backgroundColor:Color.fromRGBO(252, 14, 14, 1),
      borderRadius: 0
    );
  }

  void removeProduct(Plats product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }
  void remove(Plats product) {
    if (_products.containsKey(product) )
      _products.removeWhere((key, value) => key == product);

  }

  get products => _products;

  get productSubtotal => _products.entries
      .map((product) => product.key.prixPlat * product.value)
      .toList();

  get nombre_element => _products.length;

  get total => _products.entries
      .map((product) => product.key.prixPlat * product.value)
      .toList()
      .reduce((value, element) => value + element);

  void rafraichir(BuildContext context) {
    if (_products.length == 0)
    {
      return  Navigator.pop(context);
    }
  }
}

