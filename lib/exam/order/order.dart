
import '../item/drink.dart';
import '../item/food.dart';
import '../item/item.dart';
import 'order_status.dart';

abstract class Order {
  final int id;
  double totalPrice = 0;
  final List<Item> _items = [];
  OrderStatus orderStatus;

  List<Item> get items => _items;

  Order({
    required this.id,
  }) : orderStatus = OrderStatus();

  void addFood({required Food food}) {
    _items.add(food);
  }

  void addDrink({required Drink drink}) {
    _items.add(drink);
  }

  void removeItem({required Item item}) {
    _items.remove(item);
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
    return 'Sefaresh{id: $id, totalPrice: $totalPrice, items: $items, sefareshStatus: $orderStatus}';
  }
}
