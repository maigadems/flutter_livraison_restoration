import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/connection.dart';
import 'package:flutter_livraison_restoration/inscription.dart';
import 'package:google_fonts/google_fonts.dart';


class Accueil extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topCenter,
            colors: [Colors.red, Colors.red, Colors.grey],
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage("https://images.pexels.com/photos/1640774/pexels-photo-1640774.jpeg?auto=compress&cs=tinysrgb&w=600"),
                    ),
                    Divider(color: Colors.transparent),
                    Text.rich(
                      TextSpan(
                        text: 'BalxawFood\n',
                        style: GoogleFonts.viga(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        children: [
                          TextSpan(
                            text:'Livraison a domicile',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
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
                color: Colors.white,
                child:Padding(
                  padding: EdgeInsets.only(top: 18,bottom: 18),
                  child: Text("Continuer",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 6, 6, 1),
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