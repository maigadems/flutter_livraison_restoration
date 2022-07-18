import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/accueil.dart';
import 'package:flutter_livraison_restoration/affichageRestaurant.dart';
import 'package:flutter_livraison_restoration/categorieRestaurant.dart';
import 'package:flutter_livraison_restoration/connection.dart';
import 'package:flutter_livraison_restoration/page_panier.dart';
import 'package:flutter_livraison_restoration/test/cart_controller.dart';
import 'package:flutter_livraison_restoration/test/cart_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firestore_buckets.dart';
import 'gestion_donnees/categorieRestau.dart';




class Navigation extends StatefulWidget {
  //final CartController controller = Get.find();

  @override
  NavigationState createState() => NavigationState();


}

class NavigationState extends State <Navigation> {

  int index = 0;  // pour la barre de navigation
  final screens = [
    CategorieRestaurant(),
    CartScreen(),
    //Accueil(),
    Connection()
  ];


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: screens[index],
      bottomNavigationBar:  NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Color.fromRGBO(255, 9, 9, 0.3),
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(
                    fontSize: 0
                )
            )
        ),
        child:   NavigationBar(
          height: 38,
          backgroundColor: Color.fromRGBO(255, 9, 9, 0.1),
          selectedIndex: index,
          onDestinationSelected: (index) {
            setState(() => this.index = index);
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_filled, color: Color.fromRGBO(255, 9,
                9, 1, ),size: 26,),
              label: '',
            ),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined, size: 26,),
                label: ''
            ),
            NavigationDestination(
                icon: Icon(Icons.output_rounded, size: 26,),
                label: ''
            )
          ],

        ),

      ),
    );
  }
}

