abstract class Item {
  final int id;
  final String name;
  final String description;

  final int price;

  const Item(
      {required this.name,
      required this.id,
      required this.description,
      required this.price});

  @override
  String toString() {
    return 'Item{id: $id, name: $name, description: $description, price: $price}';
  }
}
