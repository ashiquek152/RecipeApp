import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smaple_recipe/app/modules/cartscreen/widgets/cart_items.dart';
import 'package:smaple_recipe/app/modules/models/recipe_model.dart';
import 'package:smaple_recipe/app/widgets/text_custom.dart';

import '../controllers/cartscreen_controller.dart';

class CartscreenView extends GetView<CartscreenController> {
  CartscreenView({Key? key}) : super(key: key);

  final cartController = Get.put(CartscreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 2),
                itemCount: cartController.recipeModel.length,
                itemBuilder: (context, index) {
                  final RecipeModel recipeModeldata =
                      cartController.recipeModel[index];
                  return CartItems(recipeModel: recipeModeldata);
                },
              ),
              const Divider(
                thickness: 3,
                color: Colors.black45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextCustomized(
                    text: "Total ",
                    textSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  Obx(
                    () => TextCustomized(
                      text: controller.totalAmount.value.toString(),
                      textSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
