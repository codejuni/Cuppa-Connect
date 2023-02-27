import 'package:get/get.dart';

import '../../models/coffee_model.dart';

class DetailsController extends GetxController {
  RxInt indexSize = 0.obs;
  late CoffeeModel coffee;
  Duration duration = const Duration(milliseconds: 500);

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() {
    final map = Get.arguments;
    coffee = map['coffee'];
    indexSize.value = 0;
  }

  changeSize(int index) {
    indexSize.value = index;
  }
}
