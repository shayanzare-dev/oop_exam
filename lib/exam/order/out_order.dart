
import '../item/item.dart';
import 'order.dart';
import 'order_status.dart';

class OutOrder extends Order {
  final String orderTime;
  final List<Item> _items = [];
  OrderStatus orderStatus;

  OutOrder({required super.id, required this.orderTime})
      : orderStatus = OrderStatus() {
    double result = 0;
    for (final Item item in _items) {
      result += item.price;
    }
    totalPrice = result;
  }

  @override
  String toString() {
    return 'Sefaresh{id: $id, sefareshTime: $orderTime, totalPrice: $totalPrice, items: $items, sefareshStatus: ${orderStatus.status}}';
  }
}
