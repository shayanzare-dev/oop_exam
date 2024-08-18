import 'item.dart';

class Drink extends Items {
  // Variable
  static int capacity = 10;
  int c;

  // Constractor
  Drink({
    required super.title,
    required super.description,
    required super.price,
  }) : c = capacity--;

  // Methods
  @override
  String toString() => '($title : $price)';
}
