import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'menurestaurant.dart';
import 'gestion_donnees/plats.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_livraison_restoration/accueil.dart';
import 'package:carousel_slider/carousel_slider.dart';




class RecuperationMenu extends StatefulWidget{
  @override
  RecuperationMenuState createState() => RecuperationMenuState();

}

class RecuperationMenuState extends State<RecuperationMenu> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(top: 30),
                width: size.width,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        height: size.height / 5,
                        //color: Colors.green,
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
                                  color: Color.fromRGBO(252, 14, 14, 1),
                                  fontSize: 28,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  categoriePlat(
                                      size.width / 4.5, size.height / 9, 'Ent'
                                      'ree', "lib/images/entree.jpg"),
                                  categoriePlat(
                                      size.width / 4.5, size.height / 9, 'Res'
                                      'istance', "lib/images/resistance.jpg"),
                                  categoriePlat(
                                      size.width / 4.5, size.height / 9, 'Boi'
                                      'sson', "lib/images/boisson.jpg"),
                                  categoriePlat(
                                      size.width / 4.5, size.height / 9,
                                      'Dessert', "lib/images/dessert.jpg"),
                                ],
                              ),
                            ]
                        ),
                      ),
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('Restaurant').doc
                            ('OXHfnJQOUW5xj6d6zghx').collection
                            ('plat').snapshots(),

                          builder: (context, snapshot) {
                            if (snapshot.hasError)
                              return Center(
                                  child: Text(snapshot.error.toString()));

                            if (snapshot.hasData) {
                              QuerySnapshot data = snapshot
                                  .requireData as QuerySnapshot;

                              return Container(
                                  padding: EdgeInsets.all(2),
                                  width: size.width,
                                  height: size.height / 2.5,
                                  decoration: BoxDecoration(
                                    //color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListView.builder(
                                    itemCount: data.size,
                                    itemBuilder: (context, index) {
                                      Map item = data.docs[index].data() as Map;
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        children: [
                                          CarouselSlider(
                                            options: CarouselOptions(
                                              enlargeCenterPage: true,
                                              autoPlay: false,
                                              aspectRatio: 16 / 9,
                                              reverse: true,
                                              autoPlayCurve: Curves
                                                  .fastOutSlowIn,
                                              enableInfiniteScroll: true,
                                              autoPlayAnimationDuration: Duration(
                                                  milliseconds: 800),
                                            ),
                                            items: [
                                              enfant(size.width / 2,
                                                  size.height / 6.5, "lib/image"
                                                      "s/boisson.jpg",
                                                  "Mafe Yapp", "2000 Frcs"),
                                            ],
                                          )
                                        ],
                                      );
                                    },
                                  )
                              );
                            }
                            return Center(child: CircularProgressIndicator(),);
                          }
                      )
                    ]
                )
            )
        )
    );
  }

  Stream<List<Plats>> readPlats() =>
      FirebaseFirestore.instance.collection
        ('Restaurant').doc('OXHfnJQOUW5xj6d6zghx').collection('plat')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Plats.fromJson(doc.data())).toList()
      );

  Widget stack(double width, double height, String imgPath, String
  platName, String platPrix) {
    return Stack(
      children: [
        InkWell(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(
                  MaterialPageRoute(builder: (BuildContext ctx) {
                    return Accueil();
                  }
                  )
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    Text(platPrix,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(148, 126, 9, 1),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(252, 14, 14, 1),
                      ),
                      child: Icon(Icons.add, color: Colors.white,),
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

  Column categoriePlat(double width, double height, String titre, String
  chemin) {
    return Column(
      children: [
        InkWell(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext ctx) {
                    return RecuperationMenu();
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
                        offset: Offset(10, 10)
                    ),
                  ]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(chemin,
                  width: width,
                  fit: BoxFit.cover,
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


  Widget enfant(double width, double height, String chemin, String nomPlat,
      String prix) {
    return Container(
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color.fromRGBO(232, 83, 83, 0.5),
            Color.fromRGBO(196, 196, 196, 0.15)
          ],
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: stack(width, height, chemin, nomPlat, prix),
    );
  }


  Widget details(String titre) {
    return TextButton(
        onPressed: () {},
        child: Text(
            titre,
            style: GoogleFonts.arimaMadurai(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(98, 98, 98, 1),
            )
        )
    );
  }
}

