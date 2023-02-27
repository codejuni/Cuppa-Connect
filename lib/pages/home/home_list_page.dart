import 'package:cuppa_connect/assets/app_fonts.dart';
import 'package:cuppa_connect/models/coffee_model.dart';
import 'package:cuppa_connect/pages/details/details_page.dart';
import 'package:cuppa_connect/widgets/button_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../details/details_binding.dart';
import 'home_controller.dart';

class HomeListPage extends StatelessWidget {
  const HomeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: const BackButton(color: Colors.black),
            actions: [
              iconButtonCart(
                color: Colors.black,
                count: 0,
                state: false,
              )
            ],
          ),
          body: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: -Get.size.height * 0.25,
                height: Get.size.height * 0.4,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown.shade500,
                        blurRadius: 80,
                        offset: Offset.zero,
                        spreadRadius: 50,
                      ),
                    ],
                  ),
                ),
              ),
              Transform.scale(
                scale: 1.8,
                alignment: Alignment.bottomCenter,
                child: PageView.builder(
                  itemCount: controller.coffees.length + 1,
                  scrollDirection: Axis.vertical,
                  onPageChanged: (value) {
                    if (value < controller.coffees.length) {
                      controller.nameController.animateToPage(
                        value,
                        duration: controller.duration,
                        curve: Curves.decelerate,
                      );
                    }
                  },
                  controller: controller.pageController,
                  itemBuilder: (context, index) {
                    if (index == 0) return const SizedBox.shrink();

                    CoffeeModel model = CoffeeModel.coffees[index - 1];
                    double result = controller.currentPage.value - index + 1;
                    double value = -0.4 * result + 1;
                    final opacity = value.clamp(0.0, 1.0);
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      padding: EdgeInsets.only(
                          bottom: value < 1 ? value.clamp(0.0, 2.0) * 30 : 30),
                      child: GestureDetector(
                        onTap: () {
                          if (result > 0) return;
                          Get.to(
                            () => const DetailsPage(),
                            binding: DetailsBinding(),
                            arguments: {'coffee': model},
                            duration: const Duration(milliseconds: 650),
                            transition: Transition.fadeIn,
                          );
                        },
                        child: Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..translate(
                              0.0,
                              MediaQuery.of(context).size.height /
                                  2.6 *
                                  (1 - value).abs(),
                            )
                            ..scale(value),
                          child: Opacity(
                            opacity: value < 2 ? opacity : 1,
                            child: Hero(
                              tag: model.name,
                              child: Image.asset(
                                model.image,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                height: 115,
                child: TweenAnimationBuilder(
                  tween: Tween(begin: 1.0, end: 0.0),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(0.0, -100 * value),
                      child: child,
                    );
                  },
                  duration: controller.duration,
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          itemCount: controller.coffees.length,
                          controller: controller.nameController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            CoffeeModel model = controller.coffees[index];
                            double opacity =
                                (1 - (index - controller.namePage.value).abs())
                                    .clamp(0.0, 1.0);

                            return Opacity(
                              opacity: opacity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Get.size.width * 0.2,
                                ),
                                child: Hero(
                                  tag: 'name_${model.name}',
                                  child: Material(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    elevation: 0,
                                    child: Text(
                                      model.name,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AppFonts.lato,
                                            fontSize: 24,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 15),
                      AnimatedSwitcher(
                        duration: controller.duration,
                        child: Text(
                          '\$ ${controller.coffees[controller.namePage.toInt()].price.toStringAsFixed(2)}',
                          key: Key(controller
                              .coffees[controller.namePage.toInt()].name),
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 22,
                                    fontFamily: AppFonts.montserratRegular,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).hintColor,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
