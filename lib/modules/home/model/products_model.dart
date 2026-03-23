class ProductModel {
  final String name;
  final double price;
  final String image;
  final List<String> images;

  ProductModel({
    required this.name,
    required this.price,
    required this.image,
    this.images = const [],
  });
}
