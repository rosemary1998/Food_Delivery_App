import 'package:flutter/material.dart';

import '../model/cart.dart';
import '../model/category.dart';
import '../model/fooditem.dart';
import '../services/api_service.dart';



class AppProvider extends ChangeNotifier {
  List<Category> categories = [];
  List<FoodItem> foodItems = [];
  List<CartItem> cart = [];
  String selectedCategory = '';


  Future<void> loadCategories() async {
    final data = await ApiService.fetchCategories();
    categories = data.map((e) => Category.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> loadFoodItems(String category) async {
    selectedCategory = category;
    final data = await ApiService.fetchFoodItems(category);
    foodItems = data.map((e) => FoodItem.fromJson(e)).toList();
    notifyListeners();
  }

  void addToCart(FoodItem item) {
    final existing =
    cart.indexWhere((e) => e.item.id == item.id);
    if (existing >= 0) {
      cart[existing].quantity++;
    } else {
      cart.add(CartItem(item: item));
    }
    notifyListeners();
  }

  void removeFromCart(FoodItem item) {
    cart.removeWhere((e) => e.item.id == item.id);
    notifyListeners();
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }
}

