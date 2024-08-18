import '../items/item.dart';

abstract class Order {
  // Variable
  static int count = 1;
  final int id;
  final List<Items> itemsInOrder = [];
  bool isFinished = false;

  // Constractor
  Order() : id = count++;

  // Methods
  @override
  String toString() {
    return '($itemsInOrder , total : ${totalPrice()})';
  }

  double totalPrice() {
    double total = 0;
    for (var item in itemsInOrder) {
      total += item.price;
    }
    return total;
  }
}
