import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/accueil.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPlats extends StatefulWidget {
  const DetailsPlats({Key? key}) : super(key: key);

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
          color: Color.fromRGBO(232, 83, 83, 1),
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
                        radius: 110,
                        backgroundColor: Colors.black,
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
                                color: Color.fromRGBO(232, 83, 83, 1),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Text(
                              '2000 fr',
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
                          'Hamburger Royal',
                          style: GoogleFonts.qwigley(
                              fontSize: 30,
                              color: Color.fromRGBO(232, 83, 83, 1),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Hamburger Royal fait a base de manioc',
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
                            categoriePlat(size.width / 4.5, size.height / 9,"lib/images/entree.jpg"),
                            categoriePlat(size.width / 4.5, size.height / 9,"lib/images/resistance.jpg"),
                            categoriePlat(size.width / 4.5, size.height / 9,  "lib/images/boisson.jpg"),
                          ],
                        ),
                      )
                    ],
                  ),

                ),
              )
            ],

          ),
        ),
      ),
    );
  }
  Column categoriePlat(double width, double height,String
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
      ],
    );
  }
}
