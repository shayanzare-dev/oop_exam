abstract class Items {
  // Variable
  final String title;
  final String description;
  final int price;

  // Constractor
  Items({
    required this.title,
    required this.price,
    required this.description,
  });

  // Methods
  @override
  String toString() => '($title : $price)';
}
