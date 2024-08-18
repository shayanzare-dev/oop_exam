import '../item/item.dart';
import 'sefaresh.dart';
import 'sefaresh_status.dart';

class TableSefaresh extends Sefaresh {
  final int tableCode;
  final List<Item> _items = [];
  SefareshStatus sefareshStatus;

  TableSefaresh({required super.id, required this.tableCode})
      : sefareshStatus = SefareshStatus() {
    double result = 0;
    for (final Item item in _items) {
      result += item.price;
    }
    totalPrice = result;
  }

  @override
  String toString() {
    return 'Sefaresh{id: $id, totalPrice: $totalPrice, items: $items, sefareshStatus: ${sefareshStatus.status}}';
  }
}
