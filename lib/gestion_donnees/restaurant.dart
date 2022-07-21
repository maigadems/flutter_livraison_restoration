class Restaurant {
  String idRest;
  String nomRestaurant;
  String Contact;
  String adresse;
  String photoRestaurant;
  int  distance;

  late final String _id;
  String get id => _id;
  set id(String value) {
    _id = value;
  }

  Restaurant({
    required this.idRest,
    required this.nomRestaurant,
    required this.Contact,
    required this.adresse,
    required this.photoRestaurant,
    required this.distance,
  });

  Map<String, dynamic> toJson() =>
      {
        'nomRestaurant': nomRestaurant,
        'Contact': Contact,
        'idRest': idRest,
        'adresse': adresse,
        'photoRestaurant': photoRestaurant,
        'distance' : distance
      };

  static Restaurant fromJson(Map<String, dynamic> json) =>
      Restaurant(
          idRest: json['idRest'].toString(),
          nomRestaurant: json['nomRestaurant'].toString(),
          Contact: json['Contact'].toString(),
          adresse: json['adresse'].toString(),
          photoRestaurant: json['photoRestaurant'].toString(),
          distance: json['distance']
      );
}