
import '../item/item.dart';
import 'sefaresh.dart';
import 'sefaresh_status.dart';

class OutSefaresh extends Sefaresh {
  final String sefareshTime;
  final List<Item> _items = [];
  SefareshStatus sefareshStatus;

  OutSefaresh({required super.id, required this.sefareshTime})
      : sefareshStatus = SefareshStatus() {
    double result = 0;
    for (final Item item in _items) {
      result += item.price;
    }
    totalPrice = result;
  }

  @override
  String toString() {
    return 'Sefaresh{id: $id, sefareshTime: $sefareshTime, totalPrice: $totalPrice, items: $items, sefareshStatus: ${sefareshStatus.status}}';
  }
}
