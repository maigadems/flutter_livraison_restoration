import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_livraison_restoration/accueil.dart';
import 'package:flutter_livraison_restoration/inscription_reussi.dart';
import 'package:flutter_livraison_restoration/loading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_livraison_restoration/gestion_donnees/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:email_validator/email_validator.dart';


class Inscription extends StatefulWidget {
  @override
  InscriptionState createState() => InscriptionState();
}

class InscriptionState extends State<Inscription>{
  // Les Controlleurs
  final formKey = GlobalKey<FormState>();  // Valider les camps de saisies
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerNumero = TextEditingController();
  bool loading = false;



  IconData icon = Icons.visibility_off;
  bool obscure = true;

  @override
  void dispose() {
    // TODO: implement dispose
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerNumero.dispose();
    controllerLastName.dispose();
    controllerFirstName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Definition des variables
    var size = MediaQuery.of(context).size;

    // TODO: implement build
   return  loading ? Loading()
     :Scaffold(
     body: SingleChildScrollView(
       child:  Container(
         color: Colors.white,
         margin: EdgeInsets.only(top: 15),
         width: size.width,
         height: size.height,
         child: Column(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             CircleAvatar(
               radius: 120,
               backgroundImage:AssetImage('images/BalXawFood(1).png'),
               backgroundColor: Colors.transparent,
             ),
             Padding(padding: EdgeInsets.only(top:0), child: Text
               ("Inscription", style: TextStyle(fontWeight: FontWeight.bold,
                 fontSize: 25),),),
             Form(
               key: formKey,
                 child:  Container(
                   padding: EdgeInsets.all(20),
                   height: size.height / 1.5,
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
                           else if (value.length  < 10){
                             return "L'email doit contenir au moins 10 caracteres";
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
                         validator:(value){
                           if (value!.isEmpty){
                             return 'Please enter an password';
                           }
                           else if (value.length  < 8){
                             return "Le mot de passe doit contenir au moins 8 caracteres";
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
                       TextFormField(
                         validator:(value){
                           if (value!.isEmpty){
                             return 'Please enter your First Name';
                           }
                           return null;
                         },
                         style: TextStyle(
                             fontSize: 18
                         ),
                         controller : controllerFirstName,
                         decoration: InputDecoration(
                           //focusColor: Colors.redAccent,
                           labelText: "First Name",
                           labelStyle: TextStyle(color: Colors.red[200]),
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
                         validator:(value){
                           if (value!.isEmpty){
                             return 'Please enter your Last Name';
                           }
                           return null;
                         },
                         style: TextStyle(
                             fontSize: 18
                         ),
                         controller : controllerLastName,
                         decoration: InputDecoration(
                           //focusColor: Colors.redAccent,
                           labelText: "Last Name",
                           labelStyle: TextStyle(color: Colors.red[200]),
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
                         validator:(value){
                           if (value!.isEmpty){
                             return 'Please enter your number phone';
                           }
                           return null;
                         },
                         style: TextStyle(
                             fontSize: 18
                         ),
                         controller : controllerNumero,
                         decoration: InputDecoration(
                           //focusColor: Colors.redAccent,
                           labelText: "Numero de Telephone",
                           labelStyle: TextStyle(color: Colors.red[200]),
                           prefixIcon: CountryCodePicker(
                             onChanged: print,
                             initialSelection: '+221',
                             favorite: ['+221', 'SEN'],
                             showCountryOnly: false,
                             showOnlyCountryWhenClosed: false,
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
                       ),
                       Divider(color: Colors.transparent,),
                       FlatButton(
                         onPressed:() {
                           if (formKey.currentState!.validate()){
                             final user = Users(
                               email: controllerEmail.text,
                               password: controllerPassword.text,
                               firstName: controllerFirstName.text,
                               lastName: controllerLastName.text,
                               numero: controllerNumero.text,
                             );
                             createUser(user);
                             FirebaseAuth.instance.createUserWithEmailAndPassword(
                                 email: controllerEmail.text,
                                 password:controllerPassword.text)
                                 .then((value)
                             {
                               setState(() => loading = true );
                               print("Nouveau utilisateur ");
                               Navigator.of(context).push(
                                   MaterialPageRoute(builder: (BuildContext ctx) {
                                     return InscriptionReussi(nom: controllerLastName.text, prenom:controllerFirstName.text);
                                   }));
                             }).onError((error, stackTrace){
                               print ("Erreur ${error.toString()}");
                             });
                           }
                         },
                         color: Color.fromRGBO(252, 14, 14, 1),
                         child:Padding(
                           padding: EdgeInsets.only(top: 18,bottom: 18),
                           child: Text("  S'inscrire",
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
             ),
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
