import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/accueil.dart';
import 'package:flutter_livraison_restoration/affichageRestaurant.dart';
import 'package:flutter_livraison_restoration/categorieRestaurant.dart';
import 'package:flutter_livraison_restoration/inscription.dart';
import 'package:flutter_livraison_restoration/navigation.dart';
import 'package:flutter_livraison_restoration/suite_inscription.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loading.dart';

class Connection extends StatefulWidget {
  @override
  ConnectionState createState() => ConnectionState();
}

class ConnectionState extends State<Connection>{
  final formKey = GlobalKey<FormState>();  // Valider les camps de saisies
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  IconData icon = Icons.visibility_off;
  bool obscure = true;
  bool loading = false;
  String message = '';

  @override
  void dispose() { // Liberer l'espace des controlleurs
    // TODO: implement dispose
    controllerPassword.dispose();
    controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Definition des variables
    var size = MediaQuery.of(context).size;

    // TODO: implement build
    return loading ? Loading()
      :Scaffold(
      body: SingleChildScrollView(
        child:  Container(
          color: Colors.white,
          //margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 150,
                backgroundImage:AssetImage('images/BalXawFood(1).png'),
                backgroundColor: Colors.transparent,
              ),

              Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: size.height / 1.7,
                  child : Column(
                      crossAxisAlignment:  CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                  TextFormField(
                    validator:(value){
                      if (value!.isEmpty){
                        return 'Please enter an email';
                      }
                      return null;
                    },
                  style: TextStyle(
                  fontSize: 18
                  ),
                  controller : controllerEmail,
                  decoration: InputDecoration(
                    //focusColor: Colors.redAccent,
                    labelText: "Your Email",
                    labelStyle: TextStyle(color: Colors.red[200]),
                    prefixIcon: Icon(Icons.email, color: Colors.red[200]),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide (color: Color.fromRGBO(252, 14, 14, 1), width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide (color: Color.fromRGBO(252, 14, 14, 1), width: 1.5),
                    ),
                  ),
                ),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'please enter an password';
                      }
                      return null;
                    },
                    style: TextStyle(
                        fontSize: 18
                    ),
                    controller : controllerPassword,
                    decoration: InputDecoration(
                      labelText: "Your Password",
                      labelStyle: TextStyle(color: Colors.red[200]),
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
                      ),
                      enabledBorder:OutlineInputBorder(
                        borderSide: BorderSide (color: Color.fromRGBO(252, 14, 14, 1), width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide (color: Color.fromRGBO(252, 14, 14, 1), width: 1.5),
                      ),
                    ),
                    obscureText: obscure,
                  ),
                  TextButton(
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
                  FlatButton(
                    onPressed:() {
                      if(formKey.currentState!.validate()){
                        FirebaseAuth.instance.signInWithEmailAndPassword(email: controllerEmail.text, password: controllerPassword.text)
                            .then((value) {
                          setState((){
                           /* message = "Authentification reussi";
                            final snackbar = SnackBar(
                              duration: Duration(milliseconds: 200),
                              content: Text(message,
                              style: TextStyle(color:Colors.white , fontSize: 15),
                              textAlign: TextAlign.center,
                            )
                              ,
                              backgroundColor:Colors.green[700],
                            );
                            ScaffoldMessenger.of(context).showSnackBar
                            (snackbar); */

                          });
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext ctx) {
                                return CategorieRestaurant();
                              }));
                        }).onError((error, stackTrace) {
                          setState((){
                            loading = false;
                            message = "Email ou mot de passe Incorrect";
                            final snackbar = SnackBar(content: Text(message,
                              style: TextStyle(color:Colors.white , fontSize: 15),
                              textAlign: TextAlign.center,
                            )
                              ,
                              backgroundColor:Color.fromRGBO(252, 14, 14, 1) ,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          });
                          });
                      }
                    },
                    color:Color.fromRGBO(252, 14, 14, 1),
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
                  Text('--------- OU ----------', style: TextStyle(fontSize: 20
                  ),
                    textAlign: TextAlign.center,
                  ),
                  Divider(),
                  FlatButton(
                    onPressed:() {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext ctx) {
                            return Inscription();
                          }));
                    },
                    color: Color.fromRGBO(255, 3, 3, 0.87),
                    child:Padding(
                      padding: EdgeInsets.only(top: 18,bottom: 18),
                      child: Text("Creer un nouveau compte",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                  ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}