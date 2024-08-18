import '../items/item.dart';
import 'order.dart';

class Takeaway extends Order {
  // Variable
  final String dateAndTime;

  // Constractor
  Takeaway(
      {required String this.dateAndTime, required List<Items> itemsInOrder});

  // Methods
  @override
  String toString() {
    return '($dateAndTime : $itemsInOrder , total : ${totalPrice()} , is Finished : $isFinished))';
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
