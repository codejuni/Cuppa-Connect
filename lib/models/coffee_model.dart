import 'dart:math';

import 'size_model.dart';

class CoffeeModel {
  String name;
  String image;
  double price;
  List<SizeModel> sizes;

  CoffeeModel({
    required this.name,
    required this.image,
    required this.price,
    required this.sizes,
  });

  static double _doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;
  static Random random = Random();
  static List<CoffeeModel> coffees = List.generate(
    names.length,
    (index) => CoffeeModel(
      name: names[index],
      image: 'assets/${(index + 1)}.png',
      price: _doubleInRange(random, 3, 7),
      sizes: [
        SizeModel(
          image: 'assets/taza_s.png',
          size: 'S',
        ),
        SizeModel(
          image: 'assets/taza_m.png',
          size: 'M',
        ),
        SizeModel(
          image: 'assets/taza_l.png',
          size: 'L',
        ),
      ],
    ),
  );

  static List<String> names = [
    'Caramel Cold Drink',
    'Iced Coffe Mocha',
    'Caramelized Pecan Latte',
    'Toffee Nut Latte',
    'Capuchino',
    'Toffee Nut Iced Latte'
        'Americano',
    'Caramel Macchiato',
    'Vietnamese Style Iced Coffee',
    'Black Tea Latte',
    'Classic Irish Coffee',
    'Toffee Nut Crunch Latte',
  ];
}
