import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/accueil.dart';
import 'package:flutter_livraison_restoration/affichageRestaurant.dart';
import 'package:flutter_livraison_restoration/connection.dart';
import 'package:flutter_livraison_restoration/page_panier.dart';
import 'package:flutter_livraison_restoration/test/cart_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firestore_buckets.dart';
import 'gestion_donnees/categorieRestau.dart';
import 'navigation.dart';




class CategorieRestaurant extends StatefulWidget {
  @override
  CategorieRestaurantState createState() => CategorieRestaurantState();

}

class CategorieRestaurantState extends State <CategorieRestaurant> {


  TextEditingController controllerRecherche = TextEditingController();
  int index = 0;
  final screens = [

    Connection()
  ];
  String nomPlat = " " ;
  bool mapage = true;



  @override
  void dispose() {
    // TODO: implement dispose
    controllerRecherche.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body:
    StreamBuilder <List<CategorieRestau>>(
          stream : CategorieRestaurant,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            else if (snapshot.hasData) {
              final catRest= snapshot.data!;

              return Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only( left: 10,top: 35, bottom: 20),
                        alignment: Alignment.topLeft,
                        child: Text('Veuillez\n'
                            'Selectionner votre\n'
                            'type de Restaurant',
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
                          onChanged:  (val){
                            setState((){
                              nomPlat = val;
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
                            hintText: 'Rechercher votre categorie de .........',
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
                                nomPlat = "";
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 40),
                          child:  Container(
                            width: size.width,
                            height: size.height,
                            child:  GridView(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                              children: catRest.map(buildCatRest).toList(),
                            ),
                          ),
                        )
                      ),
                    ],
                  ),

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
            decoration: BoxDecoration(color: Color.fromRGBO(236, 238, 241,
                .83)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
               // mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: (() => null),
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
  Widget buildCatRest (CategorieRestau catRest) {

    var size = MediaQuery.of(context).size;

    return Container(
        width: size.width / 2.2,
        height: size.height / 3.5,
        margin: EdgeInsets.all(9),
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topCenter,
            colors: [Color.fromRGBO(232, 83, 83, 0.5),Color.fromRGBO(196, 196, 196, 0.15) ],
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child:  Stack(
          children: [
            InkWell(
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext ctx){
                    String categorie = catRest.idCat;
                    return AffichageRestaurant(idCategorie: categorie);
                  }));
                },
                child:  Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        catRest.photoCategorie,
                        width: size.width / 3,
                        height: size.height / 8,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      catRest.nomCategorie,
                      style: GoogleFonts.radioCanada(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }

  CollectionReference _categorieRestaurant = FirebaseFirestore.instance
      .collection(FirestoreBuckets.CategorieRestaurant);
  Stream<List<CategorieRestau>> get CategorieRestaurant{
    Query queryRestaurant = _categorieRestaurant.orderBy('idCat',descending: true);
    return queryRestaurant.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return CategorieRestau(
            nomCategorie: doc.get('nomCategorie'),
            photoCategorie: doc.get('photoCategorie'),
            idCat: doc.get('idCat')
        );

      }).toList();
    });

  }

  Column categoriePlat(double width, double height, String titre, String
  chemin) {
    return Column(
      children: [
        InkWell(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext ctx) {
                    return Accueil();
                  }
                  )
              );
            },
            child: Container(
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
      children: [
        InkWell(
          child: GestureDetector(
            onTap: (){
              Navigator.of(context)
                  .push(
                  MaterialPageRoute(builder: (BuildContext ctx){
                    return Accueil();
                  }
                  )
              );
            },
            child:  Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imgPath,
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  platName,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Color.fromRGBO(252, 14, 14, 1),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( platPrix,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(148, 126, 9, 1),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:  Color.fromRGBO(252, 14, 14, 1),
                      ),
                      child: Icon (Icons.add, color: Colors.white,),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
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

    /* StreamBuilder<QuerySnapshot>(
      stream: (nom != ""&& nom != null)
          ? FirebaseFirestore.instance.collection('Restaurant').doc('OXHfnJQOUW5xj6d6zghx').collection('plat')
          .where('SearchPlat', arrayContains: nom).snapshots()
          :
    ) */
    return TextFormField(
      controller: controllerRecherche,
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
