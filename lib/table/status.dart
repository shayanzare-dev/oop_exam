enum Status { empty, full, reserved }

class TableStatus {
  Status status = Status.empty;

  void toEmptyTable() => status = Status.empty;

  void toFullTable() => status = Status.full;

  void toReservationTable() => status = Status.reserved;
}
