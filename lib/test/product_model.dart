import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  // Product's variables: name, price, imageUrl. All required.
  final String nomPlat;
  final int prixPlat;
  final String photo;
  final String id;
  final String typePlat;
  final  description;

  const Product({
    required this.nomPlat,
    required this.prixPlat,
    required this.photo,
    required this.id,
    required this.typePlat,
    required this.description
  });



 static const List<Product> products = [
   /*Product(
       name: 'Apple',
       price: 2.99,
       imageUrl:
           'https://images.unsplash.com/photo-1568702846914-96b305d2aaeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80'),
   Product(
       name: 'Orange',
       price: 2.99,
       imageUrl:
           'https://images.unsplash.com/photo-1547514701-42782101795e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
   Product(
       name: 'Pear',
       price: 2.99,
       imageUrl:
           'https://images.unsplash
           .com/photo-1548199569-3e1c6aa8f469?ixid
           =MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2
           .1&auto=format&fit=crop&w=638&q=80'), */

 ];
}