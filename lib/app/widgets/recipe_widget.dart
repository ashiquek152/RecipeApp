import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smaple_recipe/app/modules/home/controllers/home_controller.dart';
import 'package:smaple_recipe/app/widgets/text_custom.dart';
import 'package:smaple_recipe/app/modules/models/recipe_model.dart';

class RecipeWidget extends StatelessWidget {
  RecipeWidget({Key? key, required this.data}) : super(key: key);
  final RecipeModel data;
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (context) {
      return Container(
        height: 150,
        padding: const EdgeInsets.all(8),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
                height: 120,
                width: 120,
                child: Image.asset("assets/recipe.jpg")),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextCustomized(
                  text: data.recipeName,
                  textSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                const TextCustomized(text: " Description", textSize: 16),
                const Spacer(),
                Flexible(
                  child: SizedBox(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.attach_money_rounded,
                            color: Colors.green),
                        TextCustomized(
                          text: data.recipePrice.toString(),
                          textSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        data.quantity == 0
                            ? InkWell(
                                onTap: () => controller.increaseQty(data),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 90,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const TextCustomized(
                                    text: "ADD",
                                    textSize: 14,
                                    textColor: Colors.white,
                                  ),
                                ),
                              )
                            : Container(
                                height: 40,
                                width: 90,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.green),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: IconButton(
                                          onPressed: () =>
                                              controller.decreaseQty(data),
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
                                          text: data.quantity == 0
                                              ? "0"
                                              : data.quantity.toString(),
                                          fontWeight: FontWeight.bold,
                                          textColor: Colors.green,
                                        ),
                                      ),
                                      Flexible(
                                        child: IconButton(
                                          onPressed: () =>
                                              controller.increaseQty(data),
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
