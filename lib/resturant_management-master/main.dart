/*
  Ali Karimi
 */

import 'items/drink.dart';
import 'items/food.dart';
import 'resturant.dart';
import 'table.dart';

void main(List<String> args) {
  // making resturant
  Resturant resturant = Resturant();

  // Phase One
  //1
  //add item to menu
  resturant.addFood(
      food: Food(title: 'pizza', description: 'pepp', price: 200));
  resturant.addFood(
      food: Food(title: 'pasta', description: 'chicken', price: 150));
  resturant.addDrink(
      drink: Drink(title: 'pepsi', description: '300cc', price: 25));
  resturant.addDrink(
      drink: Drink(title: 'cocaCola', description: '300cc', price: 30));
  // removing item from menu
  resturant.deleteItem(itemTitle: 'cocaCola');
  // show menu
  resturant.showMenu();

  //2
  // add takeaway order
  resturant.addTakeaway(
    items: [
      Food(title: 'pizza', description: 'pepp', price: 200),
      Drink(title: 'pepsi', description: '300cc', price: 25),
      Drink(title: 'pepsi', description: '300cc', price: 25),
    ],
    dateAndTime: 'Friday 10pm',
  );
  // add item to order
  resturant.addItemToTakeaway(
    orderId: 1,
    items: [Food(title: 'pasta', description: 'chicken', price: 150)],
  );
  // remove an item from order
  resturant.deleteItemFromTakeaway(orderId: 1, itemTitle: 'pepsi');
  // changin status to finished
  resturant.finish(orderId: 1);
  // delete order
  resturant.deleteOrder(orderId: 1);
  // calculate total price
  print(resturant.totalPrice(orderId: 1));

  // show all orders
  resturant.showOrders();

  // Phase Two
  // add table to resturant
  resturant.addTable(table: Table(number: 1, capacity: 4));
  resturant.addTable(table: Table(number: 2, capacity: 8));
  resturant.addTable(table: Table(number: 3, capacity: 8));
  // remover a table
  resturant.removeTable(tableNumber: 2);
  // close a table
  resturant.closeTable(tableNumber: 1);
  // free a table
  resturant.freeTable(tableNumber: 1);
  // add inplace order
  resturant.addInPlace(
      items: [Food(title: 'pizza', description: 'pepp', price: 200)],
      tableNumber: 1);
  // add item to inplace
  resturant.addItemToIcPlace(
      orderId: 2,
      items: [Drink(title: 'pepsi', description: '300cc', price: 50)]);
  // remove an item from order
  resturant.deleteItemFromInPlace(orderId: 2, itemTitle: 'pepsi');
  // changin status to finished
  resturant.finish(orderId: 2);
  // delete order
  resturant.deleteOrder(orderId: 2);
  // calculate total price
  print(resturant.totalPrice(orderId: 2));
  // show all tables
  resturant.showTables();
  //show revenu of resturant
  resturant.showRevenu();

  // final phase
  // reserve a table
  resturant.reserveTable(tableNumber: 3);
  // cancle reservation
  resturant.cancleReservation(tableNumber: 3);
  // show all tables status
  resturant.showTables();
}
