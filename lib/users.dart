class Users {
  String id;
  String email;
  String password;
  String firstName;
  String lastName;
  String numero;

  Users({
    this.id = '',
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.numero
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'email' : email,
    'password' : password,
    'firstName' : firstName,
    'lastName' : lastName,
    'numero' : numero,
  };
}