import 'package:flutter/cupertino.dart';

class CartModelClass extends ChangeNotifier {
  // String? fruitName;
  // int? friutPrice;
  // String? fruitImage;
  //1.create a list of friuts
  final List _fruitsList = [
    // provide each fruits details
    ['Apple', '2.70', 'assets/apples.jpg'],
    ['Banana', '2.50', 'assets/bananas.jpg'],
    ['Grapes', '2.20', 'assets/grapes.jpg'],
    ['Mangoes', '4.50', 'assets/mangoes.jpg'],
    ['Oranges', '3.00', 'assets/oranges.jpg'],
    ['Papaya', '2.00', 'assets/papaya.jpg'],
    ['Peaches', '2.20', 'assets/peaches.jpg'],
    ['Pomegranate', '3.00', 'assets/pomegranate.jpg'],
    ['Straberries', '1.50', 'assets/straberries.jpg'],
    ['Watermelon', '4.50', 'assets/watermelon.jpg'],
    ['Pineapple', '2.20', 'assets/pineapples.jpg'],
  ];

  //getter for private field

// empty list of cart items
  List _cartList = [];
  get getfruitList => _fruitsList;
  get getCartList => _cartList;

  // to add selected fruits to the cart
  void addItemsToCart(int index) {
    _cartList.add(_fruitsList[index]);
    notifyListeners();
  }

  // to remove fruits from the cart
  void removeItemsFromCart(int index) {
    _cartList.removeAt(index);
    notifyListeners();
  }

  // to calculate total price of all fruits in cart

  String calculateTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < _cartList.length; i++) {
      totalPrice += double.parse(_cartList[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
