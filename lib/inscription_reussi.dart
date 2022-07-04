import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/connection.dart';
import 'package:flutter_livraison_restoration/inscription.dart';
import 'package:google_fonts/google_fonts.dart';


class InscriptionReussi extends StatelessWidget{
  final String nom;
  final String prenom;

  InscriptionReussi({Key? key, required this.nom, required this.prenom}) :super(key: key);


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor:Color.fromRGBO(252, 14, 14, 1),
                      radius: 100,
                      child: Icon(Icons.check_rounded , color: Colors.white, size: size.width/4,),
                    ),
                    Divider(color: Colors.transparent),
                    Text.rich(
                      TextSpan(
                        text: 'Congrats !\n$prenom  $nom\n',
                        style: GoogleFonts.vollkorn(
                            textStyle: TextStyle(
                              color: Colors.green[300],
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        children: [
                          TextSpan(
                            text:'Inscription Reussi',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color:Color.fromRGBO(252, 14, 14, 1),

                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed:() {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext ctx) {
                        return Connection();
                      }));
                },
                color: Color.fromRGBO(252, 14, 14, 1),
                child:Padding(
                  padding: EdgeInsets.only(top: 18,bottom: 18),
                  child: Text("S'authentifier",
                    style: TextStyle(
                        color: Colors.white,
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