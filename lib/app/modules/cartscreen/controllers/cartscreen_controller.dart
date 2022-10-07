import 'dart:developer';

import 'package:get/get.dart';
import 'package:smaple_recipe/app/modules/models/recipe_model.dart';

class CartscreenController extends GetxController {
  @override
  void onInit() {
    recipeModel = Get.arguments;
    updateTotalAmount();
    super.onInit();
  }

  List<RecipeModel> recipeModel = [];
  RxDouble totalAmount = 0.0.obs;
  List subtotals = [];

  increaseQty(RecipeModel recipeModel) {
    recipeModel.quantity = recipeModel.quantity + 1;
    updateTotalAmount();
    update();
  }

  decreaseQty(RecipeModel recipeModel) {
    if (recipeModel.quantity < 1) {
      recipeModel.quantity = 0;
    } else {
      recipeModel.quantity = recipeModel.quantity - 1;
    }
    updateTotalAmount();
    update();
  }

  updateTotalAmount() {
    subtotals.clear();
    totalAmount.value = 0;
    for (var i = 0; i < recipeModel.length; i++) {
      subtotals.add(recipeModel[i].quantity * recipeModel[i].recipePrice);
      log(subtotals.toString());
    }
    for (var i = 0; i < subtotals.length; i++) {
      totalAmount.value = totalAmount.value + subtotals[i];
    }

    update();
  }
}
