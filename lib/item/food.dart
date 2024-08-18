import 'item.dart';

class Food extends Item {
  final int limited;

  const Food(
      {required super.name, required super.description, required super.price, required super.id})
      : limited = 3;

}
