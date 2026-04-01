class ProductModel {
  String name;
  double price;
  String image;
  List<String> images;
  int qty;

  ProductModel({
    required this.name,
    required this.price,
    required this.image,
    required this.images,
    this.qty = 1,
  });
}