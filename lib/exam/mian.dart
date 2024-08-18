import 'restaurant.dart';

void main() {
  final Restaurant restaurant = Restaurant(name: 'yas', id: 1);
  restaurant.addFoodToItem(
      name: 'chicken', id: 1, description: 'hello', price: 1500);
  restaurant.addDrinkToItem(
      name: 'watter', id: 1, description: 'description', price: 200);
  restaurant.addOutOrder(id: 1, orderTime: '12:30');
  restaurant.addOutOrder(id: 2, orderTime: '7:7');
  restaurant.addFoodToItem(
      name: 'meat', id: 2, description: 'vary delicious', price: 200);
  restaurant.addDrinkToItem(name: 'cok', id: 1, description: 'good', price: 6);

  restaurant.addFoodToOrderById(
      orderId: 1, name: 'name', id: 2, description: 'description', price: 100);

  restaurant.addFoodToOrderById(
      orderId: 1, name: 'name', id: 2, description: 'description', price: 1900);
  restaurant.addFoodToOrderById(
      orderId: 2,
      name: 'vegetables',
      id: 3,
      description: 'description',
      price: 185);

  restaurant.changeToFinalOrderStatus(orderId: 1);

  restaurant.changeToFinalOrderStatus(orderId: 2);
  restaurant.calculateAllTotalPriceOrders();
}
