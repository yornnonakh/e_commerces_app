import 'package:get/get.dart';

class ProductSearchController extends GetxController {
  var query = ''.obs;
  var isSearching = false.obs;
  var results = <String>[].obs;

  final products = [
    'shoes 1',
        'shoes 2',
        'shoes 3',
        'shoes 4',
        'shoes 5',
        'shoes 6',
        'shoes 7',
        'shoes 8',
  ];
  void startSearch() {
    isSearching.value = true;
  }
  void clearSearch() {
    isSearching.value = false;
    query.value = '';
    results.clear();
  }
  void search(String text) {
    query.value = text;
    results.value = products
        .where((p) => p.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}
