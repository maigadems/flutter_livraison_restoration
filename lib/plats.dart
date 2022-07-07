class Plats {
  String id;
  String nomPlat;
  String photo;
  String prixPlat;
  String typePlat;
  String description;

  Plats({
    this.id = '',
    required this.nomPlat,
    required this.photo,
    required this.prixPlat,
    required this.typePlat,
    required this.description,
});

  Map<String, dynamic> toJson() => {
    'id': id,
    'nomPlat' : nomPlat,
    'photo' : photo,
    'prixPlat' : prixPlat,
    'typePlat' : typePlat,
    'description' : description,
  };

  static Plats fromJson (Map<String, dynamic> json) => Plats (
    id: json['id']  ?? '',
    nomPlat : json['nomPlat'] ?? '',
    photo : json['photo'] ?? '',
    prixPlat : json['prixPlat'] ?? '',
    typePlat : json['typePlat'] ?? '',
    description : json['description'] ?? '',
  );
}
