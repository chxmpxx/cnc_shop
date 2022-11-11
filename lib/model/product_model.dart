enum ProductType { pen, book, paper, eraser, marker, folder, unknown }

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
      case 'paper':
        return ProductType.paper;
      case 'marker':
        return ProductType.marker;
      case 'folder':
        return ProductType.folder;
      default:
        return ProductType.unknown;
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

  Product.fromMap({required Map<String, dynamic> productMap})
      : uid = productMap['uid'] ?? '',
        description = productMap['description'] ?? '',
        name = productMap['name'],
        photoURL = productMap['photoURL'] ?? '',
        price = productMap['price'].toDouble(),
        quantity = productMap['quantity'],
        type = getProductType(productMap['type']);

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'description': description,
        'name': name,
        'photoURL': photoURL ?? '',
        'price': price,
        'quantity': quantity,
        'type': type?.name.toString()
      };

  @override
  String toString() {
    return 'Product{uid: $uid, description: $description, name: $name, photoURL: $photoURL, price: $price, quantity: $quantity, type: $type}';
  }
}
