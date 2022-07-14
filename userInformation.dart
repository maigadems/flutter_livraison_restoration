import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


/*class Acceuil extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topCenter,
            colors: [Colors.red, Colors.redAccent, Colors.grey],
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 100,
              ),
            ),
          ],
        ),

      ) ,
    );
  }
} */

class UsersInformation extends StatefulWidget {

  const UsersInformation({ Key? key }) : super (key: key);

  @override
  _UsersInformationState  createState() => _UsersInformationState();
}

class _UsersInformationState extends State<UsersInformation>{

  // Declaration d'un flu de donnees la variable va contenir tous les flus de donnes issus de firebase
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('cl').snapshots();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Quelques choses s'est mal passe");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['Nom']),
              //subtitle: Text(data['lastname']),
            );
          }).toList(),
        );
      },
    );
  }
}