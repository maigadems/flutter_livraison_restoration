/*import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/accueil.dart';
import 'package:flutter_livraison_restoration/affichageRestaurant.dart';
import 'package:flutter_livraison_restoration/categorieRestaurant.dart';
import 'package:flutter_livraison_restoration/connection.dart';
import 'package:flutter_livraison_restoration/gestion_donnees/plats.dart';
import 'package:flutter_livraison_restoration/page_panier.dart';
import 'package:flutter_livraison_restoration/test/product_Model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartController extends GetxController {
  //static CartController instance  = Get.find();

  var produits  = {}.obs;

  //Double prixTotal  = 0.obs as Double;

  void addPlats ( Produits produit){
    if (produits.containsKey(produit)){
      produits[produit] += 1;
    }
    else{
      produits[produit] = 1;
    }
    Get.snackbar(
        " ${produit.nom} ' ajoute dans le panier",
        "Feliciations",
        snackPosition : SnackPosition.BOTTOM,
        duration : Duration (seconds: 1),
        colorText: Colors.white,
        backgroundColor: Color.fromRGBO(252, 14, 14, 1),
        margin: EdgeInsets.all(0),
        borderRadius:0,
    );
  }

  get product => produits;

  void removeProduct(Produits plat){
    if(produits.containsKey(plat) && produits[plat] == 1){
      produits.removeWhere((key, value) => key == plat);
    }
    else{
      produits[plat] -= 1;
    }
  }
  void addPlat(Produits plat){
    if(produits.containsKey(plat) ){
      produits[plat] += 1;
    }
    else{
      produits[plat] = 1;
    }
  }

  get total1produit => produits.entries.map((produit) => produit.key.prix * produit.value).toList();

  get total => produits.entries.map((produit) => produit.key.prix * produit
      .value).toList().reduce((value, element) =>  value + element)
      .toStringAsFixed(2);




}

*/
