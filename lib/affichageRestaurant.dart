import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AffichageRestaurant extends StatefulWidget{

  @override
  AffichageRestaurantState createState() => AffichageRestaurantState();

}

class AffichageRestaurantState extends State <AffichageRestaurant> {

  List<Restaurant> nosRestaurants = [
    Restaurant(
        id: "2",
        nom: "Restau1",
        tel: "772715485",
        adresse: "peulgeu",
        categorie: "dibi",
        urlImage:
        "https://cdn.pixabay.com/photo/2018/07/14/15/27/cafe-3537801__340.jpg"),
    Restaurant(
        id: "2",
        nom: "Restau2",
        tel: "782548962",
        adresse: "niarry talli",
        categorie: "dibi",
        urlImage:
        "https://cdn.pixabay.com/photo/2016/11/18/22/21/restaurant-1837150__340.jpg")
  ];

  List<String> mots = ["mots0", "mots1"];

  /*List<Widget> vueRestaurant() {
    List<Widget> vues = [];

    nosRestaurants.forEach((element) {
      final Widget = Container(

        child:

      Card(
        margin: EdgeInsets.only(left: 15,right: 15,top: 10),

        child:Container(
        height: 726/10,
        padding: EdgeInsets.all(10),
        //decoration: ,
        child:
        Row(

          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 726/11,
              width: 360/7,
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.only(right: 10),
              child: Image.network(element.urlImage,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
              Text(
                element.nom,
                style: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(252, 14, 14, 1),
                ),
              ),
              Padding(padding: EdgeInsets.all(0)),
              Row(children: [

                Text(element.distance.toString()+" min",)
              ],)

            ],),
            Spacer(),
            Icon(Icons.menu)
          ],
        ),
      )

        ,),);
      vues.add(Widget);
    });
    return vues;
  }*/




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('hauteur ${size.height}');
    print('largeur ${size.width}');
    return Scaffold(

      body:

        StreamBuilder<List<Restaurant>>(
        stream: readRestaurant(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Text('somting wrong ${snapshot.error}');
          }else if(snapshot.hasData){
            final Restaurant = snapshot.data!;

            return Container(child :
              ListView(
                children: [
                  //Padding(padding: EdgeInsets.all(10)),
                  Container(
                    margin: EdgeInsets.all(20),
                    child :
                    Row(children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(252, 14, 14, 0.1),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        //color: Color.fromRGBO(252, 14, 14, 0.1),
                        child: Icon(Icons.arrow_back_ios_new,color:Color.fromRGBO(252, 14, 14, 1)),

                      )
                    ],),),
                  Text("Nos restaurants",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(252, 14, 14, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Column(children: Restaurant.map(buildRestaurant).toList(),),
                  
                  Padding(padding: EdgeInsets.all(15)),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.home_filled,color: Color.fromRGBO(252, 14, 14, 1)),
                      Icon(Icons.shopping_cart_outlined),
                      Icon(Icons.output),
                    ],)
                ],
              )
            ,
            )

              ;
          } else { return Center(child: CircularProgressIndicator(),);}
        }
        ,
      ),

        /*
        Column(children: [
        Padding(padding: EdgeInsets.all(20)),
        Container(
          margin: EdgeInsets.all(20),
          child :
        Row(children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Color.fromRGBO(252, 14, 14, 0.1),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            //color: Color.fromRGBO(252, 14, 14, 0.1),
            child: Icon(Icons.arrow_back_ios_new,color:Color.fromRGBO(252, 14, 14, 1)),

          )
        ],),),
        Text("Nos restaurants",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(252, 14, 14, 1),
          ),
        ),
        Center(child: SingleChildScrollView(child :Column(children: vueRestaurant(size),),),),
        Padding(padding: EdgeInsets.all(15)),
        Row(

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Icon(Icons.home_filled,color: Color.fromRGBO(252, 14, 14, 1)),
          Icon(Icons.shopping_cart_outlined),
          Icon(Icons.output),
        ],)
      ],),*/
    );
  }

  Widget buildRestaurant(Restaurant restaurant) => Container(

    child:

    Card(
      margin: EdgeInsets.only(left: 15,right: 15,top: 10),

      child:Container(
        height: 726/10,
        padding: EdgeInsets.all(10),
        //decoration: ,
        child:
        Row(

          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 726/11,
              width: 360/7,
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.only(right: 10),
              child: Image.network(restaurant.urlImage,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Text(
                  restaurant.nom,
                  style: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(252, 14, 14, 1),
                  ),
                ),
                Padding(padding: EdgeInsets.all(0)),
                Expanded(child:

                  Text(restaurant.distance.toString()+" min",
                  textAlign: TextAlign.left,),
                )

              ],),
            Spacer(),
            Icon(Icons.menu)
          ],
        ),
      )

      ,),);

  Stream<List<Restaurant>> readRestaurant() => FirebaseFirestore.instance.collection('Restau').snapshots().map((snapshot) =>
  snapshot.docs.map((doc) => Restaurant.fromJson(doc.data())).toList());
}

class Restaurant {
  String id;
  String nom;
  String tel;
  String adresse;
  String categorie;
  String urlImage;
  int distance;
  //List<Plat> Plats = [];

  Restaurant(
      {required this.id,
        required this.nom,
        required this.tel,
        required this.adresse,
        required this.categorie,
        required this.urlImage,
        this.distance = 0});

  Map<String, dynamic> toJson() =>{
    'nom' : nom,
    'tel' : tel,
    'id' : id,
    'adresse' : adresse,
    'categorie' : categorie,
    'urlImage' : urlImage
  };

  static Restaurant fromJson(Map<String , dynamic> json) => Restaurant(id: json['id'].toString() , nom: json['nom'].toString() , tel: json['tel'].toString() , adresse: json['adresse'].toString() , categorie: json['categorie'].toString() , urlImage: json['urlImage'].toString() );
}