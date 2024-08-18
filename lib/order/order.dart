import '../item/item.dart';
import 'sefaresh_status.dart';

abstract class Sefaresh {
  final int id;
  double totalPrice = 0;
  final List<Item> _items = [];
  SefareshStatus sefareshStatus;

  List<Item> get items => _items;

  Sefaresh({
    required this.id,
  }) : sefareshStatus = SefareshStatus() {
    double result = 0;
    for (final Item item in _items) {
      result += item.price;
    }
    totalPrice = result;
  }

  void addFood({required Item food}) {
    _items.add(food);
  }

  void addDrink({required Item drink}) {
    _items.add(drink);
  }

  void removeDrink({required Item drink}) {
    _items.remove(drink);
  }

  void removeFood({required Item food}) {
    _items.remove(food);
  }

  double calculateTotalPrice() {
    double result = 0;
    for (final Item item in _items) {
      result += item.price;
    }
    return result;
  }

  @override
  String toString() {
    return 'Sefaresh{id: $id, totalPrice: $totalPrice, items: $items, sefareshStatus: $sefareshStatus}';
  }
}
