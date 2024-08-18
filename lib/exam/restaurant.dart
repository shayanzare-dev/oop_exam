import 'customer.dart';
import 'item/drink.dart';
import 'item/food.dart';
import 'item/item.dart';
import 'order/order.dart';
import 'order/order_status.dart';
import 'order/out_order.dart';
import 'order/table_order.dart';
import 'table/table.dart';
import 'table/tables_status.dart';

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

  List<Table> get tables => _tables;

  void addTable({
    required int code,
    required int limitedPeople,
  }) =>
      _tables.add(Table(code: code, capacity: limitedPeople));

  void addTableOrder({
    required int id,
  }) {
    int tableIndex = _tables.indexWhere(
        (element) => element.tableStatus.status == StatusTable.empty);
    if (tableIndex != -1) {
      _orders.add(TableOrder(id: id, tableCode: _tables[tableIndex].code));
    } else {
      print('sorry, not found empty table!');
    }
  }

  void addOutOrder({
    required int id,
    required String orderTime,
  }) =>
      _orders.add(OutOrder(
        id: id,
        orderTime: orderTime,
      ));

  void addDrinkToItem(
          {required String name,
          required int id,
          required String description,
          required int price}) =>
      _items.add(
          Drink(name: name, price: price, description: description, id: id));

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

  void changeToFinalOrderStatus({required int orderId}) {
    if (_isCheckOrder(orderId: orderId)) {
      final int orderIndex = getOrderIndex(orderId: orderId);
      _orders[orderIndex].orderStatus.status = Status.definitive;
    } else {
      print('not found active order');
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

  bool checkDrinkLimited({required Order order}) {
    int drinkCount = 0;
    for (final Item item in order.items) {
      if (item is Drink) {
        drinkCount++;
      }
    }

    if (drinkCount <= 3) {
      return true;
    } else {
      return false;
    }
  }

  int getOrderIndex({required int orderId}) =>
      orders.indexWhere((element) => element.id == orderId);

  void addFoodToOrderById(
      {required int orderId,
      required String name,
      required int id,
      required String description,
      required int price}) {
    if (_isCheckOrder(orderId: orderId)) {
      final int orderIndex = getOrderIndex(orderId: orderId);
      final Order order = _orders[orderIndex];
      if (order.orderStatus.status == Status.nonFinal) {
        orders[orderIndex].addFood(
            food: Food(
                name: name, id: id, description: description, price: price));
      }
    } else {
      print('not found order in list');
    }
  }

  void addDrinkToOrderById(
      {required int orderId,
      required String name,
      required int id,
      required String description,
      required int price}) {
    if (_isCheckOrder(orderId: orderId)) {
      final int orderIndex = getOrderIndex(orderId: orderId);
      final Order order = _orders[orderIndex];
      if ((order.orderStatus.status == Status.nonFinal) &&
          checkDrinkLimited(order: order)) {
        order.addDrink(
            drink: Drink(
                name: name, description: description, price: price, id: id));
      } else {
        print('we cant add to order');
      }
    } else {
      print('not found order in list');
    }
  }

  void removeItemToOrderById({required int orderId, required int itemId}) {
    if (_isCheckOrder(orderId: orderId) && _isCheckItem(itemId: itemId)) {
      final int orderIndex = getOrderIndex(orderId: orderId);
      final int itemIndex = _getItemIndex(itemId: itemId);
      final Order order = _orders[orderIndex];
      if (order.orderStatus.status == Status.nonFinal) {
        order.removeItem(item: _items[itemIndex]);
      } else {
        print('we cant remove from order');
      }
    } else {
      print('not found order in list');
    }
  }

  /// new

  void addTableToRestaurant({required int code, required int capacity}) {
    _tables.add(Table(code: code, capacity: capacity));
  }

  void removeTableToRestaurant({required int tableCode}) {
    int tableIndex = _tables.indexWhere((element) => element.code == tableCode);
    tableIndex != -1 ? _tables.removeAt(tableIndex) : print('not found table');
  }

  void changeStatusTableToFull({required int tableCode}) {
    int tableIndex = _tables.indexWhere((element) => element.code == tableCode);
    tableIndex != -1
        ? _tables[tableIndex].tableStatus.toFullTable()
        : print('not found table');
  }

  void changeStatusTableToEmpty({required int tableCode}) {
    int tableIndex = _tables.indexWhere((element) => element.code == tableCode);
    tableIndex != -1
        ? _tables[tableIndex].tableStatus.toEmptyTable()
        : print('not found table');
  }

  ///
  void calculateAllTotalPriceOrders() {
    double result = 0;
    for (final Order order in _orders) {
      if (order.orderStatus.status == Status.definitive) {
        print('order id:${order.id} => ${order.calculateTotalPrice()}');
        result += order.calculateTotalPrice();
      } else {
        print('order id:${order.id} => not definitive');
      }
    }

    print('all definitive price => $result');
  }
}
