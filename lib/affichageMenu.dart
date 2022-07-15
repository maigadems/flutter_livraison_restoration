import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter_livraison_restoration/accueil.dart';
import 'package:flutter_livraison_restoration/gestion_donnees/plats.dart';
import 'package:flutter_livraison_restoration/recuperationmenu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_livraison_restoration/loading.dart';

import 'details_plats.dart';



class AffichageMenu extends StatefulWidget {

  final String idRestaurant;

  const AffichageMenu({Key? key, required this.idRestaurant}):super(key:
  key);
  @override
  AffichageMenuState createState() => AffichageMenuState();

}

class AffichageMenuState extends State <AffichageMenu> {

  TextEditingController controllerRecherche = TextEditingController();

  String achercher = "" ;


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
                              categoriePlat(size.width / 4.5, size.height / 9, 'Ent'
                                  'ree', "lib/images/entree.jpg"),
                              categoriePlat(size.width / 4.5, size.height / 9, 'Res'
                                  'istance', "lib/images/resistance.jpg"),
                              categoriePlat(size.width / 4.5, size.height / 9, 'Boi'
                                  'sson', "lib/images/boisson.jpg"),
                              categoriePlat(size.width / 4.5, size.height / 9, 'Dessert', "lib/images/dessert.jpg"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Color.fromRGBO(217,217, 217, .2),
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
                              achercher = "";
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child:  Container(
                          width: size.width,
                          height: size.height,
                          child:  GridView(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            children: plats.map(buildPlats).toList(),
                          ),
                        ),
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
    );
  }

  // Les Methodes  pour nous faciliter la vie
  Widget buildPlats (Plats plat) {

    var size = MediaQuery
        .of(context)
        .size;
    Map<dynamic, dynamic> details = {};
    details['nomPlat'] = plat.nomPlat;
    details['photo'] = plat.photo;
    details['description'] = plat.description;
    details['prixPlat'] = plat.prixPlat;
    if(achercher == "") {


      return Container(
          width: size.width / 2.2,
          height: size.height / 3.5,
          margin: EdgeInsets.all(9),
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
          child: Stack(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                  builder: (BuildContext ctx) {
                                    return DetailsPlats(details: details);
                                  })
                              );
                            },
                            child: Column(
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
                                color: Color.fromRGBO(252, 14, 14, 1),
                              ),
                              child: InkWell(
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                            builder: (BuildContext ctx) {
                                              return Accueil();
                                            })
                                        );
                                      },
                                      child: Icon(
                                        Icons.add, color: Colors.white,)
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
    }else {
      if(plat.nomPlat.toUpperCase().contains(achercher.toUpperCase()))
        {
          return Container(
              width: size.width / 2.2,
              height: size.height / 3.5,
              margin: EdgeInsets.all(9),
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
              child: Stack(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                      builder: (BuildContext ctx) {
                                        return DetailsPlats(details: details);
                                      })
                                  );
                                },
                                child: Column(
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
                                    color: Color.fromRGBO(252, 14, 14, 1),
                                  ),
                                  child: InkWell(
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                builder: (BuildContext ctx) {
                                                  return Accueil();
                                                })
                                            );
                                          },
                                          child: Icon(
                                            Icons.add, color: Colors.white,)
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
        }else{
        return Container(child: Center(child: Text(""),),);
      }
    }
  }


  Stream<List<Plats>> readPlats() => FirebaseFirestore.instance.collection
    ('Plats').where('idRest', arrayContains: widget.idRestaurant).snapshots()
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
