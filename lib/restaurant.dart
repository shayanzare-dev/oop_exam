import 'package:oop_exam/order/out_order.dart';

import 'customer.dart';
import 'item/drink.dart';
import 'item/food.dart';
import 'item/item.dart';
import 'order/order.dart';
import 'order/table_order.dart';
import 'table/table.dart';

class Restaurant {
  final String name;
  final int id;

  Restaurant({required this.name, required this.id});

  final List<Item> _items = [];
  final List<Order> _orders = [];
  final List<Customer> customers = [];
  final List<Table> _tables = [];

  List<Item> get items => _items;

  List<Order> get orders => _orders;

  void addTable({
    required int code,
    required int limitedPeople,
  }) {
    _tables.add(Table(code: code, limitedPeople: limitedPeople));
  }

  void addTableOrder({
    required int id,
    required tableCode,
  }) =>
      orders.add(TableOrder(id: id, tableCode: tableCode));

  void addOutOrder({
    required int id,
    required String sefareshTime,
  }) {
    _orders.add(OutOrder(
      id: id,
      sefareshTime: sefareshTime,
    ));
  }

  void addDrinkToItem(
      {required String name,
      required int id,
      required String description,
      required int price}) {
    // todo (): drink has limited
    _items
        .add(Drink(name: name, price: price, description: description, id: id));
  }

  void addFoodToItem(
          {required String name,
          required int id,
          required String description,
          required int price}) =>
      _items.add(
          Food(name: name, price: price, description: description, id: id));

  void removeItem({required int itemId}) {
    final int itemIndex = _getItemIndex(itemId: itemId);
    if (itemIndex != -1) {
      _items.removeAt(itemIndex);
      print('succesfuly remove');
    } else {
      print('not found item for remove');
    }
  }

  int _getItemIndex({required int itemId}) =>
      _items.indexWhere((element) => element.id == itemId);

  void showItems() {
    for (int i = 0; i < _items.length; i++) {
      print('${i + 1}-${_items[i]}');
    }
  }

  bool _isCheckOrder({required int orderId}) =>
      orders.any((element) => element.id == orderId);

  bool _isCheckItem({required int itemId}) =>
      _items.any((element) => element.id == itemId);

  void addFoodToOrderById(
      {required int orderId,
      required String name,
      required int id,
      required String description,
      required int price}) {
    if (_isCheckOrder(orderId: orderId)) {
      orders[orderId].addFood(
          food:
              Food(name: name, id: id, description: description, price: price));
    } else {
      print('not found order in list');
    }
  }

  void addDrinkToSefareshById(
      {required int sefareshId,
      required String name,
      required int id,
      required String description,
      required int price}) {
    if (_isCheckOrder(orderId: sefareshId)) {
      orders[sefareshId].addDrink(
          drink: Drink(
              name: name, id: id, description: description, price: price));
    } else {
      print('not found safaresh in list');
    }
  }

  void removeFoodToSefareshById(
      {required int sefareshId, required int itemId}) {
    if (_isCheckOrder(orderId: sefareshId) && _isCheckItem(itemId: itemId)) {
      orders[sefareshId].removeFood(food: _items[itemId]);
    } else {
      print('not found order or item in list');
    }
  }

  void removeDrinkToSefareshById(
      {required int sefareshId, required int itemId}) {
    if (_isCheckOrder(orderId: sefareshId) && _isCheckItem(itemId: itemId)) {
      orders[sefareshId].removeDrink(drink: _items[itemId]);
    } else {
      print('not found order or item in list');
    }
  }

}
