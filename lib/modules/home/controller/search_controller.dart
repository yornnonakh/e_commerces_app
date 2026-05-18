import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchControllerX extends GetxController {
  var searchText = ''.obs;
  var results = <String>[].obs;

  // Dummy data (replace with Firebase/API later)
  final List<String> allProducts = [
    "Sabar Nike",
    "Product",
    "Sabar New branch",
    "Nike Model",
    "Popular ",
  ];
  void onSearch(String value) {
    searchText.value = value;
    if (value.isEmpty) {
      results.clear();
    } else {
      results.value = allProducts
          .where((item) => item.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
  }
}
void showSearchDialog() {
  final controller = Get.put(SearchControllerX());
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: controller.onSearch,
              decoration: InputDecoration(
                hintText: "Search product...",
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.results.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(controller.results[index]));
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
