enum Status { nonFinal, definitive }

class OrderStatus {
  Status status = Status.nonFinal;

  void toFinal() => status = Status.definitive;

  void toNonFinal() => status = Status.nonFinal;
}
