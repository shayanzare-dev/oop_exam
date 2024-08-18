import '../item/item.dart';
import 'order.dart';
import 'order_status.dart';

class TableOrder extends Order {
  final int tableCode;
  final List<Item> _items = [];
  @override
  OrderStatus orderStatus = OrderStatus();

  TableOrder({required super.id, required this.tableCode})
      : orderStatus = OrderStatus() {
    double result = 0;
    for (final Item item in _items) {
      result += item.price;
    }
    totalPrice = result;
  }

  @override
  String toString() {
    return 'Sefaresh{id: $id, totalPrice: $totalPrice, items: $items, sefareshStatus: ${orderStatus.status}}';
  }
}
