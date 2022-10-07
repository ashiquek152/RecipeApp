import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smaple_recipe/app/widgets/text_custom.dart';
import 'package:smaple_recipe/app/widgets/recipe_widget.dart';
import 'package:smaple_recipe/app/modules/models/recipe_model.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextCustomized(
                      text: "Salads & Soups",
                      textSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const Divider(thickness: 2),
                      itemCount: controller.recipeModelList.length,
                      itemBuilder: (context, index) {
                        final RecipeModel data =
                            controller.recipeModelList[index];
                        return RecipeWidget(data: data);
                      },
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: [
                          const Icon(
                            Icons.shopping_cart,
                            color: Colors.black45,
                          ),
                          Obx(
                            () => TextCustomized(
                              text:
                                  " ${controller.selectedItemCount.value.toString()} Items",
                              textSize: 18,
                              textColor: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () => controller.onpressPlaceOrder(),
                        child: const TextCustomized(
                          text: "Place order",
                          textSize: 20,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
