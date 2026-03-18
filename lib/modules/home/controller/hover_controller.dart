import 'package:get/get.dart';

class HoverController extends GetxController {
  var hoverIndex = (-1).obs;
  var favoriteList = <int>[].obs;

  void setHover(int index) => hoverIndex.value = index;
  void clearHover() => hoverIndex.value = -1;

  void toggleFavorite(int index) {
    if (favoriteList.contains(index)) {
      favoriteList.remove(index);
    } else {
      favoriteList.add(index);
    }
  }

  bool isFavorite(int index) => favoriteList.contains(index);
}