import '../items/item.dart';
import 'order.dart';

class InPlace extends Order {
  // Variable
  final int tableNumber;

  // Constractor
  InPlace({required this.tableNumber, required List<Items> itemsInOrder});

  // Methods
  @override
  String toString() {
    return '(table $tableNumber : $itemsInOrder , total : ${totalPrice()} , is Finished : $isFinished))';
  }

  @override
  double totalPrice() {
    double total = 0;
    for (var item in itemsInOrder) {
      total += item.price;
    }
    return total;
  }
}
