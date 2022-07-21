import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/accueil.dart';
import 'package:flutter_livraison_restoration/test/cart_controller.dart';
import 'package:flutter_livraison_restoration/test/cart_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'categorieRestaurant.dart';
import 'connection.dart';
import 'gestion_donnees/plats.dart';

class DetailsPlats extends StatefulWidget {

  Map<dynamic, dynamic> details = {};
   final Plats plats;
  final cartController = Get.put(CartController());


  DetailsPlats({Key? key, required this.plats}) : super(key: key);

  @override
  State<DetailsPlats> createState() => _DetailsPlatsState();
}

class _DetailsPlatsState extends State<DetailsPlats> {

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin:Alignment.topLeft,
              colors: [Color.fromRGBO(255, 6, 6, 1),Colors.redAccent, Color.fromRGBO
                (232,
                  83, 83, 1)],
              end: Alignment.topRight,
            ),
          ),
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 50),
                  width: size.width,
                height: size.height / 3,
                child: Center(
                  child: Container(

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color.fromRGBO(216, 126, 126, 0.3),Color
                            .fromRGBO(255, 255, 255, 0.2) ],
                      ),
                    ),
                    child: Center(
                      child: CircleAvatar(
                        radius: 120,
                        backgroundImage: NetworkImage(widget.plats.photo),
                      ),
                    ),
                  ),
                )

              ),
              Expanded(
                child:  Container(
                 alignment: Alignment.topLeft,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.only(topLeft: Radius.circular
                      (45)),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30, left: 20),
                            padding: EdgeInsets.only(top: 15, bottom: 15, right:
                            40, left: 40),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(252, 14, 14, 1),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Text(
                              widget.plats.prixPlat.toString() + ' Fr',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Colors.white
                              ),
                            ),
                          ),

                        ],

                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        alignment: Alignment.topLeft,
                        child:Text(
                          widget.plats.nomPlat,
                          style: GoogleFonts.viga(
                              fontSize: 27,
                              color: Color.fromRGBO(252, 14, 14, 1),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                            '${widget.plats.description}',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Color.fromRGBO(111, 111, 112, 1),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 10),
                        alignment: Alignment.topLeft,
                        child:
                            Text(
                              'Supplément',
                              style: GoogleFonts.poppins(
                                color: Color.fromRGBO(69, 69,69,1),
                                fontWeight: FontWeight.w600,
                                fontSize: 20
                              ),
                            ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            categoriePlat(size.width / 4.5, size.height / 9,"https://thumbs.dreamstime.com/b/moutarde-de-jaune-de-heinz-73067499.jpg"),
                            categoriePlat(size.width / 4.5, size.height / 9,"https://preview.free3d.com/img/2018/03/2162667825506813547/mcm5i9rq-900.jpg"),
                            categoriePlat(size.width / 4.5, size.height / 9,  "https://market.rapidos.sn/wp-content/uploads/2020/07/redhotgm.jpg"),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            FlatButton(
                              onPressed:() {
                                widget.cartController.addProduct(widget.plats);
                              },
                              color: Color.fromRGBO(232, 83, 83, 1),
                              child:Padding(
                                padding: EdgeInsets.only(top: 18,bottom: 18),
                                child: Text("Ajouter au panier",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 19
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
                    ],
                  ),

                ),
              )
            ],

          ),
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Container(
            height: 50,
            width: size.width,
           // padding: EdgeInsets.all(10),
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
  Container categoriePlat(double width, double height,String
  chemin) {
    return Container(
      child: Stack(
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
                padding: EdgeInsets.all(1),
                width: width,
                height: height,
                decoration: BoxDecoration(
                    color:  Color.fromRGBO(232, 83, 83, 1),
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
                  child: Image.network(
                    chemin,
                    width: width,
                    fit:BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 75, left: 75),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(232, 83, 83, 1),
              ),
              child: InkWell(
                  child: GestureDetector(
                      onTap: (){
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (BuildContext ctx){
                          return Accueil();
                        })
                        );
                      },
                      child:Icon (Icons.add, color: Colors.white,)
                  )
              )
          ),
        ],
      ),

    );
  }
}
