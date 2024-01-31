import 'package:flutter/material.dart';
import 'package:statemanagement_3c/models/product.dart';

class Products extends ChangeNotifier {
  List<Product> _items = [];

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

  void edit(Product p, int index) {
    _items[index] = p;
    notifyListeners();
  }

  Product item(int index) {
    return _items[index];
  }

  void toggleFavorite(int index) {
    _items[index].isFavorite = !_items[index].isFavorite;
    notifyListeners();
  }
}
