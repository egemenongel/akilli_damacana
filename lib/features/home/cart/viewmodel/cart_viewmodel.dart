import 'package:akilli_damacana/features/home/home_view/model/products_list_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  final List<ProductModel> cart = [];
  double total = 0;
  addOrder(ProductModel order) {
    cart.add(order);
    sumProducts();
    notifyListeners();
  }

  removeOrder(ProductModel order) {
    cart.remove(order);
    sumProducts();
    notifyListeners();
  }

  increment(ProductModel order) {
    var count = order.count!;
    count++;
    order.count = count;
    sumProducts();
    notifyListeners();
  }

  decrement(ProductModel order) {
    var count = order.count!;
    if (count != 1) {
      count--;
      order.count = count;
    }
    sumProducts();
    notifyListeners();
  }

  sumProducts() {
    total = 0;
    for (var order in cart) {
      total += order.price! * order.count!;
    }
  }
}
