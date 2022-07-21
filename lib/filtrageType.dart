import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/test/cart_controller.dart';
import 'package:flutter_livraison_restoration/test/cart_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'categorieRestaurant.dart';
import 'connection.dart';
import 'details_plats.dart';
import 'gestion_donnees/plats.dart';
import 'gestion_donnees/restaurant.dart';

class FiltrageType extends StatefulWidget {
  final Restaurant restaurant;
  final String typePlat;
  final cartController = Get.put(CartController());

  FiltrageType({Key? key, required this.restaurant, required this.typePlat}) : super
(key: key);

  @override
  State<FiltrageType> createState() => _FiltrageTypeState();
}


class _FiltrageTypeState extends State<FiltrageType> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                        Container(
                          padding: EdgeInsets.all(5),
                          width: size.width,
                          height: size.height / 3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(widget.restaurant.photoRestaurant)
                              )
                          ),
                          child: Stack(
                            alignment: AlignmentDirectional.bottomStart,
                            children: [
                              Container(
                                color: Color.fromRGBO(255, 255, 255, .7),
                                width: size.width,
                                child: Text('Restaurant : ${widget.restaurant.nomRestaurant}',
                                  style: GoogleFonts.viga(
                                    fontSize: 30,
                                    color: Color.fromRGBO(252, 14, 14, 1),
                                  ),
                                  textAlign: TextAlign.center,
                                ) ,
                              )

                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Text('Nos ${widget.typePlat}s',
                            style: GoogleFonts.vibes(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                              
                            ),
                          )
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
    ('Plats').where('idRest', arrayContains: widget.restaurant.idRest).where('typePlat', isEqualTo: widget.typePlat)
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => Plats.fromJson(doc.data())).toList());


}

/*    body: SingleChildScrollView(
        child:
        Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [

              Container(
                child:  ,
              )
            ],
          ),
        ),
      )
    );*/
