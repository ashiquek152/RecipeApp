import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smaple_recipe/app/modules/cartscreen/controllers/cartscreen_controller.dart';

import 'package:smaple_recipe/app/modules/models/recipe_model.dart';
import 'package:smaple_recipe/app/widgets/text_custom.dart';

class CartItems extends StatelessWidget {
  CartItems({required this.recipeModel, super.key});

  final RecipeModel recipeModel;
  final cartController = Get.put(CartscreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextCustomized(
            text: recipeModel.recipeName,
            textSize: 18,
            fontWeight: FontWeight.bold,
          ),
          GetBuilder<CartscreenController>(builder: (context) {
            return Column(
              children: [
                Container(
                  height: 40,
                  width: 90,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: IconButton(
                            onPressed: () =>
                                cartController.decreaseQty(recipeModel),
                            icon: const TextCustomized(
                              textSize: 25,
                              text: "-",
                              fontWeight: FontWeight.bold,
                              textColor: Colors.green,
                            ),
                          ),
                        ),
                        Flexible(
                          child: TextCustomized(
                            textSize: 16,
                            text: recipeModel.quantity.toString(),
                            fontWeight: FontWeight.bold,
                            textColor: Colors.green,
                          ),
                        ),
                        Flexible(
                          child: IconButton(
                            onPressed: () =>
                                cartController.increaseQty(recipeModel),
                            icon: const Icon(
                              Icons.add,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextCustomized(
                  text:
                      "\$ ${(recipeModel.recipePrice * recipeModel.quantity).toString()}",
                  textSize: 18,
                  fontWeight: FontWeight.bold,
                )
              ],
            );
          })
        ],
      ),
    );
  }
}
