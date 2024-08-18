import 'table_status.dart';

class Table {
  final int code;
  final int limitedPeople;
  final TableStatus tableStatus;

  Table({required this.code, required this.limitedPeople})
      : tableStatus = TableStatus();
}
