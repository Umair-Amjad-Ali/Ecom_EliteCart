import 'package:flutter/material.dart';
import 'Product.dart';

class Cart extends ChangeNotifier {
  final List<CartItem> _items = [];


  List<CartItem> get items => _items;

  void add(Product product, {int quantity = 1}) {
    for (var item in _items) {
      if (item.product.id == product.id) {
        item.numOfItem += quantity;
        notifyListeners();
        return;
      }
    }
    _items.add(CartItem(product: product, numOfItem: quantity));
    notifyListeners();
  }


  void remove(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    for (var item in _items) {
      total += item.product.price * item.numOfItem;
    }
    return total;
  }
}

class CartItem {
  final Product product;
  int numOfItem;

  CartItem({required this.product, required this.numOfItem});
}

