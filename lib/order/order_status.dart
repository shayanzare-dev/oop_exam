class SefareshStatus {
  String status = 'not final';

  void toFinal() => status = 'final';

  void toNotFinal() => status = 'not final';
}
