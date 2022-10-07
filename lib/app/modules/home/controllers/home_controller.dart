import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smaple_recipe/app/modules/cartscreen/views/cartscreen_view.dart';
import 'package:smaple_recipe/app/modules/models/recipe_model.dart';
import 'package:smaple_recipe/app/widgets/text_custom.dart';

class HomeController extends GetxController {
  @override
  void dispose() {
    selectedItems.clear();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    addDataToList();
  }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }

//   void increment() => count.value++;
// }

  List<Map<String, dynamic>> recipeis = [
    {
      "recipe": "Mixed Salad",
      "price": 14.5,
      "qty": 0,
    },
    {
      "recipe": "Cucumber Salad",
      "price": 11.5,
      "qty": 0,
    },
    {
      "recipe": "Wangyu Salad",
      "price": 10,
      "qty": 0,
    },
    {
      "recipe": "Something Salad",
      "price": 9,
      "qty": 0,
    },
    {
      "recipe": "Recipe 4 Salad",
      "price": 51,
      "qty": 0,
    },
  ];

  List<RecipeModel> recipeModelList = [];

  addDataToList() {
    for (var element in recipeis) {
      recipeModelList.add(
        RecipeModel(
          recipeName: element["recipe"],
          recipePrice: element["price"].toDouble(),
          quantity: element["qty"].toInt(),
        ),
      );
    }
  }

  List<RecipeModel> selectedItems = [];

  RxInt selectedItemCount = 0.obs;

  increaseQty(RecipeModel data) {
    if (selectedItems.contains(data)) {
      data.quantity = data.quantity + 1;
    } else {
      data.quantity = data.quantity + 1;
      selectedItems.add(data);
    }
    log(selectedItems.toString());
    selectedItemCount.value = selectedItems.length;
    update();
  }

  decreaseQty(RecipeModel data) {
    if (selectedItems.contains(data)) {
      data.quantity = data.quantity - 1;
      if (data.quantity == 0) {
        selectedItems.remove(data);
      }
    } else {
      data.quantity < 1 ? data.quantity = 0 : data.quantity = data.quantity - 1;
    }
    selectedItemCount.value = selectedItems.length;
    update();
  }

  onpressPlaceOrder() {
    if (selectedItems.isEmpty) {
      Get.snackbar("", "",
          titleText: const TextCustomized(
            text: "Cart is empty",
            textSize: 25,
            textColor: Colors.white,
          ),
          messageText: const TextCustomized(
            text: "No items selected",
            textSize: 18,
            textColor: Colors.black45,
          ));
      return;
    }
    Get.to(() => CartscreenView(), arguments: selectedItems);
  }
}
