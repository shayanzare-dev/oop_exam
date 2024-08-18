import 'tables_status.dart';

class TableStatus {
  StatusTable status = StatusTable.empty;

  void toEmptyTable() => status = StatusTable.empty;

  void toFullTable() => status = StatusTable.full;

  void toReservationTable() => status = StatusTable.reserved;
}
