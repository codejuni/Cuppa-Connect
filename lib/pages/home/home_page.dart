import 'package:cuppa_connect/models/coffee_model.dart';
import 'package:cuppa_connect/widgets/button_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../binding/home_binding.dart';
import '../cart/cart_controller.dart';
import 'home_list_page.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! < -10) {}
          Get.to(
            () => const HomeListPage(),
            duration: const Duration(milliseconds: 800),
            transition: Transition.fadeIn,
            binding: HomeBinding(),
            curve: Curves.decelerate,
          );
        },
        child: Stack(
          children: [
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0XFFA89276),
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              height: size.height * 0.4,
              left: 0,
              right: 0,
              top: size.height * 0.15,
              child: Hero(
                tag: CoffeeModel.coffees[6].name,
                child: Image.asset(
                  CoffeeModel.coffees[6].image,
                ),
              ),
            ),
            Positioned(
              height: size.height * 0.7,
              left: 0,
              right: 0,
              bottom: 0,
              child: Hero(
                tag: CoffeeModel.coffees[7].name,
                child: Image.asset(
                  CoffeeModel.coffees[7].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              height: size.height,
              left: 0,
              right: 0,
              bottom: -size.height * 0.8,
              child: Hero(
                tag: CoffeeModel.coffees[8].name,
                child: Image.asset(
                  CoffeeModel.coffees[8].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              height: 140,
              left: 0,
              right: 0,
              bottom: size.height * 0.25,
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                iconButtonCart(
                  color: Colors.white,
                  count: 0,
                  state: true,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
