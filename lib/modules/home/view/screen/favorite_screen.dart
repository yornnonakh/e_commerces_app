import 'package:e_commerces/modules/home/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();
    return Scaffold(
      appBar: AppBar(title: Text("Favorites")),
      body: Obx(() {
        if (favoriteController.favoriteList.isEmpty) {
          return Center(child: Text("No favorite items"));
        }

        return ListView.builder(
          itemCount: favoriteController.favoriteList.length,
          itemBuilder: (context, index) {
            final product = favoriteController.favoriteList[index];

            return ListTile(
              leading: Image.asset(product.image, width: 50),
              title: Text(product.name),
              subtitle: Text("\$${product.price}"),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  favoriteController.toggleFavorite(product);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
