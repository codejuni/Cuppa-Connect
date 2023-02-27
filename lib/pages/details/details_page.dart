import 'package:cuppa_connect/widgets/button_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets/app_fonts.dart';
import 'details_controller.dart';

class DetailsPage extends GetWidget<DetailsController> {
  const DetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(
            color: Colors.black,
          ),
          actions: [
            iconButtonCart(
              color: Colors.black,
              count: 0,
              state: false,
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
              child: Hero(
                tag: 'name_${controller.coffee.name}',
                child: Material(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0,
                  child: Text(
                    controller.coffee.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.lato,
                          fontSize: 23,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: size.height * 0.52,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.04,
                          ),
                          child: Hero(
                            tag: controller.coffee.name,
                            child: Image.asset(
                              controller.coffee.image,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: Get.size.width * 0.75,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                    )
                                  ],
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: size.width * 0.1,
                    bottom: 0,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 1.0, end: 0.0),
                      builder: (context, value, child) {
                        return Transform.translate(
                            offset: Offset(-100 * value, 240 * value),
                            child: child);
                      },
                      duration: controller.duration,
                      child: Text(
                        '\$ ${controller.coffee.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 55,
                          fontFamily: AppFonts.openSans,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 35,
                              spreadRadius: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                    List.generate(controller.coffee.sizes.length, (index) {
                  bool selected = index == controller.indexSize.value;
                  return InkWell(
                    onTap: () => controller.changeSize(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(
                              controller.coffee.sizes[index].image,
                              height: ((index + 1) * 12),
                              color: selected ? Colors.black : Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            controller.coffee.sizes[index].size,
                            style: TextStyle(
                              color: selected ? Colors.black : Colors.grey,
                              fontSize: 18,
                              fontFamily: AppFonts.lato,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hot/Warm',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.montserratBold,
                      ),
                    ),
                    Container(
                      width: 1.5,
                      height: 40,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.black,
                            Colors.white,
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'Cold/Ice',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontFamily: AppFonts.montserratBold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
