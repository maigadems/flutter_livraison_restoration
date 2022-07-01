import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/accueil.dart';
import 'package:flutter_livraison_restoration/inscription.dart';
import 'package:google_fonts/google_fonts.dart';
import 'users.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class SuiteInscription extends StatefulWidget {

  final String email;
  final String password;

  const SuiteInscription({Key? key, required this.email, required this.password}) : super(key: key);

  @override
  SuiteInscriptionState createState()=> SuiteInscriptionState();
}

class SuiteInscriptionState extends State<SuiteInscription> {


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    // Les Controlleurs
    final controllerFirstName = TextEditingController();
    final controllerLastName = TextEditingController();
    final controllerNumero = TextEditingController();


    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child:  Container(
          margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
          color: Colors.white,
          width: size.width,
          height: size.height,
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child:IconButton(onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext ctx) {
                        return Inscription();
                      }
                      )
                  );
                },
                  icon: Icon(Icons.arrow_back_ios,
                      color: Colors.red[200],
                      size: 30,
                    ),
                  splashColor: Colors.pink,
                  splashRadius: 20,
                ),
              ),
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
                    Padding(padding: EdgeInsets.only(top:30), child: Text ("Donnez vos Informations", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),)
                  ],
                ),
              ),

              Container(
                width: size.width,
                padding: EdgeInsets.all(15),
                height: size.height / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      controller : controllerFirstName,
                      decoration: InputDecoration(
                        //focusColor: Colors.redAccent,
                        labelText: "First Name",
                        labelStyle: TextStyle(color: Colors.red[200]),
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

                    Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                      child:  TextField(
                        controller:  controllerLastName,
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          labelStyle: TextStyle(color: Colors.red[200]),
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
                    ), TextField(
                      controller: controllerNumero,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        //focusColor: Colors.redAccent,
                        labelText: "Numero",

                        labelStyle: TextStyle(color:Colors.red[200]),
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
                    Spacer(),
                    FlatButton(
                      onPressed:() {

                        final user = Users(
                            email: widget.email,
                            password: widget.password,
                            firstName: controllerFirstName.text,
                            lastName: controllerLastName.text,
                            numero: controllerNumero.text,
                        );
                        createUser(user);
                      },
                      color: Color.fromRGBO(232, 83, 83, 1),
                      child:Padding(
                        padding: EdgeInsets.only(top: 18,bottom: 18),
                        child: Text("Suivant",
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
              )
            ],
          ),
        ),
      ),
    );
  }
  Future createUser(Users user) async {
    final docUser = FirebaseFirestore.instance.collection('Users').doc();
    final json = user.toJson();
    await docUser.set(json);

  }
}