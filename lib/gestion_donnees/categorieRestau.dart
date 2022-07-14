class CategorieRestau {
  String idCat;
  String nomCategorie;
  String photoCategorie;

  CategorieRestau({
    required this.idCat,
    required this.nomCategorie,
    required this.photoCategorie,
  });

  Map<String, dynamic> toJson() => {
    'idCat': idCat,
    'nomCategorie' : nomCategorie,
    'photoCategorie' : photoCategorie,
  };

  static CategorieRestau fromJson (Map<String, dynamic> json) =>
  CategorieRestau(
    idCat: json['idCat']  ?? '',
    nomCategorie : json['nomCategorie'] ?? '',
    photoCategorie : json['photoCategorie'] ?? '',

  );
}
