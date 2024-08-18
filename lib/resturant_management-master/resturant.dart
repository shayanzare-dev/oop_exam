import 'items/drink.dart';
import 'items/food.dart';
import 'items/item.dart';
import 'orders/order.dart';
import 'orders/takeaway.dart';
import 'orders/inPlace.dart';
import 'table.dart';

class Resturant {
  // Variable
  List<Items> _menu = [];
  List<Order> _orders = [];
  List<Table> _tables = [];

  // Methods
  // add a food to menu
  void addFood({required Food food}) => (menu.any((f) => f.title == food.title))
      ? print('${food.title} is already exist')
      : menu.add(food);

  // add a drink to menu
  void addDrink({required Drink drink}) =>
      (menu.any((d) => d.title == drink.title))
          ? print('${drink.title} is already exist')
          : menu.add(drink);

  // delete an item from menu
  void deleteItem({required String itemTitle}) {
    int index = menu.indexWhere((item) => item.title == itemTitle);
    menu.removeAt(index);
  }

  void showMenu() => print('menu : ${menu}');
  void showOrders() => print('orders : ${orders}');
  void showTables() => print('tables : ${tables}');

  // delete an order from list
  void deleteOrder({required int orderId}) {
    if (orders[orderIndex(orderId: orderId)].isFinished) {
      print('cant delete finished order');
    } else {
      orders.removeAt(orderIndex(orderId: orderId));
    }
  }

  // add takeaway order
  void addTakeaway({required List<Items> items, required String dateAndTime}) {
    Takeaway t = Takeaway(dateAndTime: dateAndTime, itemsInOrder: items);
    t.itemsInOrder.addAll(items);
    orders.add(t);
  }

  // add inPlace order
  void addInPlace({required List<Items> items, required int tableNumber}) {
    if (isAnyTableFree()) {
      if (tables[tableIndex(tableNumber: tableNumber)].status == 'free') {
        InPlace i = InPlace(tableNumber: tableNumber, itemsInOrder: items);
        orders.add(i);
        i.itemsInOrder.addAll(items);
        // close the table
        tables[tableIndex(tableNumber: tableNumber)].status = 'close';
      } else {
        print('this table is not free');
      }
    } else {
      print('there is no free table at this time');
    }
  }

  // add item to inplace order
  void addItemToIcPlace({required int orderId, required List<Items> items}) {
    if (!orders[orderIndex(orderId: orderId)].isFinished) {
      orders[orderIndex(orderId: orderId)].itemsInOrder.addAll(items);
    } else {
      print('cant change finished orders');
    }
  }

  // delete an item from inplace order
  void deleteItemFromInPlace(
      {required int orderId, required String itemTitle}) {
    // finding order from list
    Order o = orders[orderIndex(orderId: orderId)];
    // if oreder is not final
    if (!o.isFinished) {
      // finding item from order
      int index = o.itemsInOrder.indexWhere((item) => item.title == itemTitle);
      // remove that item
      o.itemsInOrder.removeAt(index);
    } else {
      print('cant change finished orders');
    }
  }

  // finilize the order
  void finish({required int orderId}) {
    orders[orderIndex(orderId: orderId)].isFinished = true;
  }

  // add item to takeaway order
  void addItemToTakeaway({required int orderId, required List<Items> items}) {
    if (!orders[orderIndex(orderId: orderId)].isFinished) {
      orders[orderIndex(orderId: orderId)].itemsInOrder.addAll(items);
    } else {
      print('cant change finished orders');
    }
  }

  // delete an item from takeaway order
  void deleteItemFromTakeaway(
      {required int orderId, required String itemTitle}) {
    // finding order from list
    Order o = orders[orderIndex(orderId: orderId)];
    // if oreder is not final
    if (!o.isFinished) {
      // finding item from order
      int index = o.itemsInOrder.indexWhere((item) => item.title == itemTitle);
      // remove that item
      o.itemsInOrder.removeAt(index);
    } else {
      print('cant change finished orders');
    }
  }

  // calculate total price of order
  double totalPrice({required int orderId}) {
    return orders[orderIndex(orderId: orderId)].totalPrice();
  }

  // get index of order
  int orderIndex({required int orderId}) =>
      orders.indexWhere((order) => order.id == orderId);

  // get index of tablw
  int tableIndex({required int tableNumber}) =>
      tables.indexWhere((table) => table.number == tableNumber);

  // is table free
  bool isAnyTableFree() => tables.any((table) => table.status == 'free');

  // get order from list
  Order getOrder({required int orderId}) =>
      orders[orderIndex(orderId: orderId)];

  // add a table to resturant
  void addTable({required Table table}) =>
      (!tables.any((t) => t.number == table.number))
          ? tables.add(table)
          : print('this table is already exist !');

  // remover a table from resturant
  void removeTable({required int tableNumber}) {
    tables.removeAt(tableIndex(tableNumber: tableNumber));
  }

  // close a table
  void closeTable({required int tableNumber}) {
    int index = tables.indexWhere((element) => element.number == tableNumber);
    tables[index].status = 'close';
  }

  // free a table
  void freeTable({required int tableNumber}) {
    int index = tables.indexWhere((element) => element.number == tableNumber);
    tables[index].status = 'free';
  }

  // print revenu
  void showRevenu() {
    print('finished orders : ');
    for (var order in orders) {
      if (order.isFinished) {
        print(order);
      }
    }
    print('revenu = ${calculateRevenu()}');
  }

  // calculate revenu
  double calculateRevenu() {
    double sum = 0;
    for (var order in orders) {
      if (order.isFinished) {
        sum += order.totalPrice();
      }
    }
    return sum;
  }

  // reserve a table
  void reserveTable({required int tableNumber}) {
    if (tables[tableIndex(tableNumber: tableNumber)].status == 'free') {
      tables[tableIndex(tableNumber: tableNumber)].status = 'reserved';
    } else {
      print('this table is close now !');
    }
  }

  // cancle reservation
  void cancleReservation({required int tableNumber}) =>
      freeTable(tableNumber: tableNumber);

  // Getter
  List<Items> get menu => _menu;
  List<Order> get orders => _orders;
  List<Table> get tables => _tables;
}
