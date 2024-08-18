import 'item.dart';

class Food extends Items {
  // Variable

  // Constractor
  Food({
    required super.title,
    required super.description,
    required super.price,
  });

  // Methods
  @override
  String toString() => '($title : $price)';
}
