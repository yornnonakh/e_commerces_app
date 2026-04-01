import 'package:e_commerces/app/config/app_assets.dart';

class ProductModelDetail {
  final List<String>? images;

  ProductModelDetail({required this.images});

  String? get name => null;

  get price => null;
}

final ProductModelDetail product = ProductModelDetail(
  images: AppAssetsLatestProducts.latestProductsDetail,
);
