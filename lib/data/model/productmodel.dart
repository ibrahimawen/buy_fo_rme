class Product {
  final String title;
  final String price;
  final String imageUrl;
  final String url;

  Product(
      {required this.title,
      required this.price,
      required this.imageUrl,
      required this.url});

  // Factory constructor to create a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      url: json['url'],
    );
  }
}
