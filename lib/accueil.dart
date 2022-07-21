import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/affichageCategorie.dart';
import 'categorieRestaurant.dart';
import 'package:flutter_livraison_restoration/affichageMenu.dart';
import 'package:flutter_livraison_restoration/affichageRestaurant.dart';
import 'package:flutter_livraison_restoration/connection.dart';
import 'package:flutter_livraison_restoration/gestion_donnees/categorieRestau.dart';
import 'package:flutter_livraison_restoration/inscription.dart';
import 'package:flutter_livraison_restoration/inscription_reussi.dart';
import 'package:flutter_livraison_restoration/menuRestaurant.dart';
import 'package:flutter_livraison_restoration/menurestaurant.dart';
import 'package:flutter_livraison_restoration/recuperationmenu.dart';
import 'package:google_fonts/google_fonts.dart';


class Accueil extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topCenter,
            colors: [Color.fromRGBO(255, 6, 6, 1), Colors.red, Colors.grey],
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 200,
                      backgroundImage: AssetImage('images/BalXawFood.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    Divider(color: Colors.transparent),
                  ],
                ),
              ),
              FlatButton(
                onPressed:() {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext ctx) {
                        return CategorieRestaurant();
                      }));
                },
                color: Colors.white,
                child:Padding(
                  padding: EdgeInsets.only(top: 18,bottom: 18),
                  child: Text("Continuer",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 6, 6, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}