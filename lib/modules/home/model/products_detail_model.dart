import 'package:e_commerces/app/config/app_assets.dart';

class ProductModelDetail {
  final List<String>? images;

  ProductModelDetail({required this.images});
}

final ProductModelDetail product = ProductModelDetail(
  images: AppAssetsLatestProducts.latestProductsDetail,
);
