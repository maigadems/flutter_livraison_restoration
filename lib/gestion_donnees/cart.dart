/* class Cart {
  String id;
  String image;
  String name;
  int quantity;
  double cost;
  String productId;
  double price;

  Cart({
    required this.id,
    required this.image,
    required this.name,
    required this.quantity,
    required this.cost,
    required this.productId,
    required this.price
});

  Map<String , dynamic> toJson() => {
    'id': id,
    'productId': productId,
    'image': image,
    'name': name,
    'quantity': quantity,
    'cost': price * quantity,
    'price': price
  };

  static Cart fromJson (Map <String, dynamic> json) => Cart(
    id: json['id']  ?? '',
    productId : json['productId'] ?? '',
    image : json['image'] ?? '',
    name : json['name'],
    quantity : json['quantity'] ?? '',
    cost : json['cost'] ?? '',
    price : json['price'] ?? '',

  );

}

 */
