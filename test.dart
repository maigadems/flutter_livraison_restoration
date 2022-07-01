import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Test extends StatefulWidget{
  @override
  TestState createState() => TestState();

}

class TestState extends State<Test> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: TextField(controller: controller),
        actions: [
          IconButton(
              onPressed: (){
                final nom = controller.text;
                createUser (nom : nom);
              },
              icon: Icon(Icons.add),
          )
        ],

      ),

    );
  }


  Future createUser({required nom}) async {
    final docUser = FirebaseFirestore.instance.collection('Users').doc('2');

    final json = {
      'nom': nom,
      'age': 20,
      'birthday': DateTime(2001, 7, 28),
    };

    await docUser.set(json);

  }
}
