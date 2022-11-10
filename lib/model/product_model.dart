enum ProductType { pen, book, eraser }

class Product {
  final String? uid;
  final String? description;
  final String name;
  final String? photoURL;
  final double price;
  final int quantity;
  final ProductType? type;

  static ProductType? getProductType(String type) {
    switch (type.toLowerCase()) {
      case 'pen':
        return ProductType.pen;
      case 'book':
        return ProductType.book;
      case 'eraser':
        return ProductType.eraser;
    }
  }

  Product(
      {this.uid,
      this.description,
      required this.name,
      this.photoURL,
      required this.price,
      required this.quantity,
      this.type});

  Product.fromMap({required Map<String, dynamic> userMap})
      : uid = userMap['uid'],
        description = userMap['description'],
        name = userMap['name'],
        photoURL = userMap['photoURL'],
        price = userMap['price'],
        quantity = userMap['quantity'],
        type = userMap['type'];

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'description': description,
        'name': name,
        'photoURL': photoURL ?? '',
        'price': price,
        'quantity': quantity,
        'type': type
      };
}
