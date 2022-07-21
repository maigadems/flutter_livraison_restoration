import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter_livraison_restoration/accueil.dart';
import 'package:flutter_livraison_restoration/categorieRestaurant.dart';
import 'package:flutter_livraison_restoration/filtrageType.dart';
import 'package:flutter_livraison_restoration/gestion_donnees'
    '/cart_controller2.dart';
import 'package:flutter_livraison_restoration/gestion_donnees/plats.dart';
import 'package:flutter_livraison_restoration/gestion_donnees/restaurant.dart';
import 'package:flutter_livraison_restoration/page_panier.dart';
import 'package:flutter_livraison_restoration/recuperationmenu.dart';
import 'package:flutter_livraison_restoration/test/cart_controller.dart';
import 'package:flutter_livraison_restoration/test/cart_screen.dart';
import 'package:flutter_livraison_restoration/test/product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_livraison_restoration/loading.dart';
import 'connection.dart';
import 'details_plats.dart';



class AffichageMenu extends StatefulWidget {

   final Restaurant restaurant;
  final cartController = Get.put(CartController());


  AffichageMenu({Key? key, required this.restaurant}):super(key:
  key);
  @override
  AffichageMenuState createState() => AffichageMenuState();

}

class AffichageMenuState extends State <AffichageMenu> {

  //final cartController  = Get.put(CartController());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: StreamBuilder <List<Plats>>(
            stream : readPlats(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              else if (snapshot.hasData) {
                final plats = snapshot.data!;

                return Container(
                  child: Column(
                  children: [
                    //Padding(padding: EdgeInsets.all(10)),
                    Container(
                      margin: EdgeInsets.only(top: 35, bottom: 20),
                      height: size.height / 5,
                      width: size.width,
                      decoration: BoxDecoration(

                          boxShadow: [
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Categorie de plats',
                            style: GoogleFonts.poppins(
                              color:Color.fromRGBO(252, 14, 14, 1),
                              fontSize: 28,
                            ),
                          ),
                          Row(

                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              categoriePlat(size.width / 5, size.height / 10,
                                  'Ent'
                                  'ree', "lib/images/entree.jpg"),
                              categoriePlat(size.width / 5, size.height / 10,
                                  'Res'
                                  'istance', "lib/images/resistance.jpg"),
                              categoriePlat(size.width / 5, size.height /
                                  10, 'Boi'
                                  'sson', "lib/images/boisson.jpg"),
                              categoriePlat(size.width / 5, size.height / 10,
                                  'Dessert', "lib/images/dessert.jpg"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Color.fromRGBO(217,217, 217, .2),
                      margin: EdgeInsets.only(right: 18, left: 18),
                      child:TextFormField(
                        onChanged:  (val){
                          setState((){
                            if (val.length > 0){
                              print('Salut');
                            }
                          });
                        },
                        validator:(value){
                          if (value!.isEmpty){
                            return 'Please enter a motif';
                          }
                          return null;
                        },
                        style: TextStyle(
                            fontSize: 18
                        ),
                        decoration: InputDecoration(
                          //focusColor: Colors.redAccent,
                          hintText: 'Rechercher par nom du plat.........',
                          hintStyle: TextStyle(color: Colors.red[200]),
                          prefixIcon: IconButton(
                            icon: Icon(Icons.search,
                              size: 30,
                              color: Colors.red[200],
                            ),
                            splashColor: Colors.red[200],
                            onPressed: (){},
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.close_outlined,
                              size: 30,
                              color: Colors.red[200],
                            ),
                            splashColor: Colors.red[200],
                            onPressed: (){
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child:  Container(
                            width: size.width,
                            height: size.height ,
                            child:  GridView(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                              children: plats.map(buildPlats).toList(),
                            ),
                          ),
                        )
                    ),
                  ],
                  )
                );
              }
              else {
                return Center(child: CircularProgressIndicator());
              }
            }
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.transparent),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: () => Get.to(() => CategorieRestaurant()),
                    icon:Icon(Icons.home_filled,
                      color: Colors.redAccent,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Get.to(() => CartScreen()),
                    icon:Icon(Icons.shopping_cart_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      FirebaseAuth.instance.signOut().then((value) =>
                          Get.to(() => Connection())
                      );
                    },
                    icon:Icon(Icons.output_rounded,

                    ),
                  ),
                ]
            )
        )
    );
  }

  // Les Methodes  pour nous faciliter la vie
  Widget buildPlats (Plats plat) {

    var size = MediaQuery.of(context).size;
    final Plats plats;
    return Container(
      width: size.width / 2.2,
      height: size.height / 3.5,
      margin: EdgeInsets.all(9),
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient( 
          begin:Alignment.topLeft,
          colors: [Color.fromRGBO(232, 83, 83, 0.5),Color.fromRGBO(196, 196, 196, 0.15) ],
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child:  Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (BuildContext ctx){
                            return  DetailsPlats(plats: plat);
                          })
                          );
                        },
                        child:  Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                plat.photo,
                                width: size.width / 3,
                                height: size.height / 8,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              plat.nomPlat,
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Color.fromRGBO(252, 14, 14, 1),
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        plat.prixPlat.toString() + ' Frcs',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(148, 126, 9, 1),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:Color.fromRGBO(252, 14, 14, 1),
                        ),
                        child: InkWell(
                            child: GestureDetector(
                              onTap: (){
                                widget.cartController.addProduct(plat);
                              },
                              child:Icon (Icons.add, color: Colors.white,)
                            )
                        )
                      )
                    ],
                  ),
                ]
            )
          ]

      )
    );
  }


  Stream<List<Plats>> readPlats() => FirebaseFirestore.instance.collection
    ('Plats').where('idRest', arrayContains: widget.restaurant.idRest).snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Plats.fromJson(doc.data())).toList());



  Column categoriePlat(double width, double height, String titre, String
  chemin) {
    return Column(
      children: [
        InkWell(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext ctx) {
                    return FiltrageType(restaurant: widget.restaurant, typePlat : titre);
                  }
                  )
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 5),
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        color: Colors.grey.withOpacity(.2),
                        offset: Offset(10,10)
                    ),
                  ]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(chemin,
                  width: width,
                  fit:BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Text(titre,
          style: TextStyle(
              color: Color.fromRGBO(98, 98, 98, 1),
              fontSize: 18
          ),
        )
      ],
    );
  }


  Widget stack (double width , double height , String imgPath,String
  platName, String platPrix){
    return Stack(

    );
  }


  Widget enfant(double width , double height , String chemin, String nomPlat,
      String prix){
    return  Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin:Alignment.topLeft,
          colors: [Color.fromRGBO(232, 83, 83, 0.5),Color.fromRGBO(196, 196, 196, 0.15) ],
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: stack(width / 1.2 , height / 2 ,chemin, nomPlat, prix),
    );
  }


  Widget details( String titre, String nom) {
    return TextFormField(
      onChanged: (val) {
        setState(() {
          nom = val;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a motif';
        }
        return null;
      },
      style: TextStyle(
          fontSize: 18
      ),
      decoration: InputDecoration(
        //focusColor: Colors.redAccent,
        hintText: 'Rechercher par nom du plat.........',
        hintStyle: TextStyle(color: Colors.red[200]),
        prefixIcon: IconButton(
          icon: Icon(Icons.search,
            size: 30,
            color: Colors.red[200],
          ),
          splashColor: Colors.red[200],
          onPressed: () {},
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.close,
            size: 20,
            color: Colors.red,
          ),
          splashColor: Colors.red[200],
          onPressed: () {},
        ),
      ),
    );
  }
}
