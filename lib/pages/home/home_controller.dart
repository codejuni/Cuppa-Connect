import 'package:cuppa_connect/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CoffeeModel> coffees = <CoffeeModel>[].obs;
  RxDouble initialPage = 8.0.obs;
  late PageController pageController;
  late PageController nameController;
  RxDouble currentPage = 0.0.obs;
  RxDouble namePage = 0.0.obs;
  Duration duration = const Duration(milliseconds: 300);

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.removeListener(coffeeScrollListener);
    nameController.removeListener(nameScrollListener);
    pageController.dispose();
    nameController.dispose();
  }

  void getData() {
    coffees.value = CoffeeModel.coffees;
    pageController = PageController(
      viewportFraction: 0.35,
      initialPage: initialPage.toInt(),
    );
    nameController = PageController(
      initialPage: initialPage.toInt(),
    );
    currentPage.value = initialPage.value;
    namePage.value = initialPage.value;
    pageController.addListener(coffeeScrollListener);
    nameController.addListener(nameScrollListener);
    isLoading.value = true;
    update();
  }

  void coffeeScrollListener() {
    currentPage.value = pageController.page ?? 0;
    update();
  }

  void nameScrollListener() {
    namePage.value = currentPage.value;
    update();
  }
}
