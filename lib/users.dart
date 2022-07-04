class Users {
  String id;
  String email;
  String password;
  String firstName;
  String lastName;
  String numero;
  String? urlProfil;

  Users({
    this.id = '',
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.numero,
    this.urlProfil
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
}