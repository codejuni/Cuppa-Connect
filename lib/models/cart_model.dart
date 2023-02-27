import 'coffee_model.dart';

class CartModel {
  CoffeeModel coffee;
  int size;
  int count;

  CartModel({
    required this.coffee,
    required this.size,
    required this.count,
  });
}
