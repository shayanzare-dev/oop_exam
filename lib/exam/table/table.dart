import 'status.dart';

class Table {
  final int code;
  final int capacity;
  final TableStatus tableStatus;

  Table({required this.code, required this.capacity})
      : tableStatus = TableStatus();
}
