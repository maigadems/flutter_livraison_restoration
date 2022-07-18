import 'cart.dart';
import 'package:logger/logger.dart';

//Logger logger = Logger();


class Users {
  String id;
  String email;
  String password;
  String firstName;
  String lastName;
  String numero;
  String? urlProfil;
  //List<Cart>? cart;

  Users({
    this.id = '',
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.numero,
    this.urlProfil,
   // this.cart,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'email' : email,
    'password' : password,
    'firstName' : firstName,
    'lastName' : lastName,
    'numero' : numero,
    'Url Profil' :urlProfil,
  };
/*
  List<Cart> _convertirCart(List  cart) {

    List<Cart> _resultats = [];
    logger.i(cart.length);

    cart.forEach((element) {
      _resultats.add(Cart.fromJson(element));
    });



    return _resultats;

  } */
}