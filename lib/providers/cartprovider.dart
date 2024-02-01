import 'package:flutter/material.dart';
import 'package:statemanagement_3c/models/cartitem.dart';

class CartItems extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalNoItems => _items.length;

  void add(CartItem cartItem) {
    // int index = 0;
    // bool isFound = false;
    // for (; index <= _items.length - 1; index++) {
    //   if (_items[index].productCode == cartItem.productCode) {
    //     isFound = true;
    //     break;
    //   }
    // }

    // if (isFound) {
    //   _items[index].quantity++;
    // } else {
    //   _items.add(cartItem);
    // }

    //List<CartItem> _items
    print('contents of _items');
    _items.forEach((item) => print('${item.productCode} ${item.quantity}'));

    var codeList =
        _items.map((item) => item.productCode).toList(); //list of productcodes
    var index = codeList.indexOf(cartItem.productCode);
    print('$index index');
    if (index < 0) {
      _items.add(cartItem);
    } else {
      _items[index].quantity++;
    }

    notifyListeners();
  }
}
