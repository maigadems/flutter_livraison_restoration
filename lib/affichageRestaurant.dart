import 'dart:async';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter_livraison_restoration/firestore_buckets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_livraison_restoration/affichageCategorie.dart';
import 'package:flutter_livraison_restoration/affichageMenu.dart';
import 'package:flutter_livraison_restoration/menurestaurant.dart';
import 'gestion_donnees/restaurant.dart';

class AffichageRestaurant extends StatefulWidget{

  final String idCategorie;

  const AffichageRestaurant({Key? key, required this.idCategorie}):super(key:
  key);

  @override
  AffichageRestaurantState createState() => AffichageRestaurantState();

}

class AffichageRestaurantState extends State <AffichageRestaurant> {

  TextEditingController controllerRecherche = TextEditingController();
  String? motif;
  String achercher = "";



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body:StreamBuilder<List<Restaurant>>(
        stream: readRestaurant(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Text('something is wrong :  ${snapshot.error}');
          }
          else if(snapshot.hasData){

            final Restaurant = snapshot.data!;


            return Container(
                child : Column(
                children: [
                  Container(
                    margin: EdgeInsets.only( left: 10,top: 35, bottom: 20),
                    alignment: Alignment.topLeft,
                    child: Text('Nos Restaurants \n'
                        'les plus proches\n'
                        'de chez vous !',
                      style: GoogleFonts.poppins(
                          fontSize: 25,
                          color: Color.fromRGBO(238, 84, 84, 1),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    //color: Color.fromRGBO(217,217, 217, .2),
                    margin: EdgeInsets.only(right: 18, left: 18),
                    child:TextFormField(
                      controller: controllerRecherche,
                      onChanged:  (newString){
                        setState((){
                          achercher = newString;
                        });
                      },
                      style: TextStyle(
                          fontSize: 18
                      ),
                      decoration: InputDecoration(
                        hintText: 'Mettez ici le nom du Restau .........',
                        hintStyle: TextStyle(color: Colors.red[200]),
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search,
                            size: 30,
                            color: Colors.red[200],
                          ),
                          splashColor: Colors.red[200],
                          onPressed: (){setState(){}},
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close_outlined,
                            size: 30,
                            color: Colors.red[200],
                          ),
                          splashColor: Colors.red[200],
                          onPressed: (){
                            motif = "";
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child:  Container(
                      width: size.width,
                      height: size.height,
                      child:  ListView(
                        children:Restaurant.map(buildRestaurant).toList()
                      ),
                    ),
                  ),
                ],
              )
            );
          }else {
            return Center(child: CircularProgressIndicator()
            );
          }
        }
      ),
        floatingActionButton: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(Icons.home_filled,color: Color.fromRGBO(252, 14, 14, 1)),
                Icon(Icons.shopping_cart_outlined),
                Icon(Icons.output),
              ]
          )
        )
    );
  }

  Widget buildRestaurant(Restaurant restaurant) {
    var size = MediaQuery.of(context).size;

    if(achercher=='') {
      return Container(
          width: size.width,
          height: size.width / 4.5,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(9),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color.fromRGBO(232, 83, 83, 0.5),
                Color.fromRGBO(196, 196, 196, 0.15)
              ],
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        restaurant.photoRestaurant,
                        width: size.width / 4,
                        height: size.height / 5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 15),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text.rich(
                                  TextSpan(
                                      text: '${restaurant.nomRestaurant}\n\n',
                                      style: GoogleFonts.rubik(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(252, 14, 14, 1),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: restaurant.distance.toString() +
                                              " min",
                                          style: GoogleFonts.rubik(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal
                                          ),

                                        )
                                      ]
                                  )
                              )
                            ]
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext ctx) {
                            String restPlat = restaurant.idRest;
                            return AffichageMenu(idRestaurant: restPlat);
                          }
                          )
                      );
                    },
                      icon: Icon(Icons.menu_sharp,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ]
          )
      );
    }else {if(restaurant.nomRestaurant.toUpperCase().contains(RegExp(achercher.toUpperCase()),0)) {
      return Container(
          width: size.width,
          height: size.width / 4.5,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(9),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color.fromRGBO(232, 83, 83, 0.5),
                Color.fromRGBO(196, 196, 196, 0.15)
              ],
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        restaurant.photoRestaurant,
                        width: size.width / 4,
                        height: size.height / 5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 15),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text.rich(
                                  TextSpan(
                                      text: '${restaurant.nomRestaurant}\n\n',
                                      style: GoogleFonts.rubik(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(252, 14, 14, 1),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: restaurant.distance.toString() +
                                              " min",
                                          style: GoogleFonts.rubik(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal
                                          ),

                                        )
                                      ]
                                  )
                              )
                            ]
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext ctx) {
                            String restPlat = restaurant.idRest;
                            return AffichageMenu(idRestaurant: restPlat);
                          }
                          )
                      );
                    },
                      icon: Icon(Icons.menu_sharp,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ]
          )
      );
    }else{return Container(child: Center(child: Text(""),),);}
    }
  }

Stream<List<Restaurant>> readRestaurant() {
    
    return
      FirebaseFirestore.instance
        .collection('Restaurant').where('idCat',arrayContains: widget.idCategorie)
          .snapshots()  
          .map(
                (snapshot) =>
                  snapshot.docs.map((doc) => Restaurant.fromJson(doc.data())).toList());
  }
}
