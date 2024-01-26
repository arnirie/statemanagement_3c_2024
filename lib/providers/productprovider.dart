import 'package:flutter/material.dart';
import 'package:statemanagement_3c/models/product.dart';

class Products extends ChangeNotifier {
  List<Product> _items = [
    Product(productCode: 'AB1', nameDesc: 'iPhone15', price: 56000),
    Product(productCode: 'ET1', nameDesc: 'Samsung Galaxy', price: 35000),
  ];

  List<Product> get items {
    return _items;
  }

  int get totalNoItems {
    return _items.length;
  }

  void add(Product p) {
    _items.add(p);
    notifyListeners();
  }
}
