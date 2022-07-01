import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/accueil.dart';
import 'package:flutter_livraison_restoration/inscription.dart';
import 'package:flutter_livraison_restoration/suite_inscription.dart';
import 'package:google_fonts/google_fonts.dart';

class Connection extends StatefulWidget {
  @override
  ConnectionState createState() => ConnectionState();
}

class ConnectionState extends State<Connection>{

  IconData icon = Icons.visibility_off;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {

    // Definition des variables
    var size = MediaQuery.of(context).size;

    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child:  Container(
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height / 3,
                width: size.width,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:NetworkImage("https://images.pexels.com/photos/1640774/pexels-photo-1640774.jpeg?auto=compress&cs=tinysrgb&w=600"),
                    ),
                    Text("BalxawFood",
                        style: GoogleFonts.viga(
                            textStyle: TextStyle(
                              color: Color.fromRGBO(232, 83, 83, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )
                        )
                    ),
                    Text("livraison a domicile"),
                    Padding(padding: EdgeInsets.only(top:30), child: Text ("Connectez vous", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),)
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(15),
                height: size.height / 1.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    TextField(
                      decoration: InputDecoration(
                        //focusColor: Colors.redAccent,
                        labelText: "Your Email",
                        labelStyle: TextStyle(color: Colors.black38),
                        prefixIcon: Icon(Icons.email, color: Colors.red[200]),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide (color: Colors.black87, width: 2.0),
                        ),
                        enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide (color: Colors.redAccent, width: 1.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    //Padding(padding: EdgeInsets.only(top: 10),

                    Padding(padding: EdgeInsets.only(top: 10),
                      child:  TextField(
                        decoration: InputDecoration(
                          labelText: "Your Password",
                          labelStyle: TextStyle(color: Colors.black38),
                          prefixIcon: Icon(Icons.lock, color: Colors.red[200]),
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState((){
                                obscure = !obscure;
                              });
                            },
                            child: Icon((obscure)
                                ? Icons.visibility_off
                                : Icons.visibility
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide (color: Colors.black87, width: 2.0),
                          ),
                          enabledBorder:OutlineInputBorder(
                            borderSide: BorderSide (color: Colors.redAccent, width: 1.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        obscureText: obscure,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: (){

                        },
                        child: Text(
                          'Mot de passe oublie ?',
                          style: TextStyle(
                              color: Colors.red[300]
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Spacer(),
                    FlatButton(
                      onPressed:() {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext ctx) {
                              return Inscription();
                            }));
                      },
                      color: Color.fromRGBO(232, 83, 83, 1),
                      child:Padding(
                        padding: EdgeInsets.only(top: 18,bottom: 18),
                        child: Text("Se connecter",
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
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Vous n'avez pas de compte ?", style:  TextStyle( color: Color.fromRGBO(255, 29, 29, 1)),),
                          ElevatedButton(onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (BuildContext ctx) {
                                  return Inscription();
                                }));
                          },
                              child: Text('Rejoindre',style:TextStyle (color : Colors.redAccent,)),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 5,
                              shadowColor: Colors.redAccent,
                              side: BorderSide(
                                color: Colors.redAccent,
                                width: 2.0
                              )
                            )
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
