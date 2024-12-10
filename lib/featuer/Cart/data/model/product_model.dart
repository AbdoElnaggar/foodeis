//ignore_for_file: prefer_final_fields, unused_field, unused_element, dangling_library_doc_comments

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cartmodel extends ChangeNotifier {
  final List _shopItems = [
    //burger
    ['assets/image/popular1.png', 'Combo spicy tender', '\$10.15'],
    ['assets/image/popular1.png', 'Combo Tender Grill', '\$10'],
    ['assets/image/burgerKing.png', 'Combo BBQ Bacon ', '\$22'],
    //fried chicken
    ['assets/image/chicken.png', 'Chicken BBQ', '\$10.15'],
    ['assets/image/chicken2.png', 'Combo Chicken Crispy ', '\$10'],
    ['assets/image/chicken3.png', 'Combo BBQ Bacon', '\$22'],
  ];

  final List _popularitems = [
    ['assets/image/popular1.png', 'Extreme cheese f', '\$10.15'],
    ['assets/image/popular2.png', 'Singles BBQ bacon\ncheese burger', '\$10'],
    ['assets/image/popular4.png', 'Potato chip Burrger\ncheese', '\$22'],
  ];

Cartmodel(){
  _loadCartItems();
}
  List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;
  get popularitems => _popularitems;
  // Add to cart
  void addItem(int index) {
    _cartItems.add(_shopItems[index]);
    _saveCartItems();
    notifyListeners();
  }

  // Remove from cart
  void removeItem(int index) {
    _cartItems.removeAt(index);
     _saveCartItems();
    notifyListeners();
  }

//add popular
  void addItempopular(int index) {
    _cartItems.add(_popularitems[index]);
    _saveCartItems();
    notifyListeners();
  }

  // Remove popular from cart
  void removeItempopular(int index) {
    _cartItems.removeAt(index);
    _saveCartItems();
    notifyListeners();
  }

  // Calculate total price
  double get totalPrice {
    double total = 0;
    for (var item in _cartItems) {
      total += double.parse(item[2].replaceAll('\$', ''));
    }
    return total;
  }

  void _saveCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartItemsJson = jsonEncode(_cartItems);
    prefs.setString('cartItems', cartItemsJson);
  }

  void _loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartItemsJson = prefs.getString('cartItems');
    if (cartItemsJson != null) {
      _cartItems = List<List<dynamic>>.from(jsonDecode(cartItemsJson));
      notifyListeners();
    }
  }
}

///////////////
///
///
///
///
///
///

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:graduate_app/core/constant/category.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CartModel extends ChangeNotifier {
//   CartModel() {
//     _loadCartItems();
//   }

//   final List _cartItems = [];
//   final List _popularItemsList = []; // New list for popular items

//   List<ResturantList> _shopItems =
//       resturantlist; // Initialize with restaurant list

//   List get shopItems => _shopItems;
//   List get cartItems => _cartItems;
//   List get popularItemsList => _popularItemsList;

//   // Add special product to cart
//   void addItemSpecial(ResturantList restaurant, int index) {
//     _cartItems.add(restaurant.specialProducts[index]);
//     _saveCartItems();
//     notifyListeners();
//   }

//   // Remove special product from cart
//   void removeItemSpecial(ResturantList restaurant, int index) {
//     _cartItems.remove(restaurant.specialProducts[index]);
//     _saveCartItems();
//     notifyListeners();
//   }

// //remove
//   void removeItem(int index) {
//     _cartItems.removeAt(index);
//     _saveCartItems();
//     notifyListeners();
//   }

//   // Add popular item to cart
//   void addItemPopular(ResturantList restaurant, int index) {
//     _popularItemsList.add(restaurant.popularItems[index]);
//     _savePopularItems();
//     notifyListeners();
//   }

//   // Remove popular item from cart
//   void removeItemPopular(ResturantList restaurant, int index) {
//     _popularItemsList.remove(restaurant.popularItems[index]);
//     _savePopularItems();
//     notifyListeners();
//   }

//   // Calculate total price
//   double get totalPrice {
//     double total = 0;
//     for (var item in _cartItems) {
//       total += double.parse(item[2].replaceAll('\$', ''));
//     }
//     for (var item in _popularItemsList) {
//       total += double.parse(item[2].replaceAll('\$', ''));
//     }
//     return total;
//   }

//   void _saveCartItems() async {
//     final prefs = await SharedPreferences.getInstance();
//     final cartItemsJson = jsonEncode(_cartItems);
//     prefs.setString('cartItems', cartItemsJson);
//   }

//   void _savePopularItems() async {
//     final prefs = await SharedPreferences.getInstance();
//     final popularItemsJson = jsonEncode(_popularItemsList);
//     prefs.setString('popularItemsList', popularItemsJson);
//   }

//   void _loadCartItems() async {
//     final prefs = await SharedPreferences.getInstance();
//     final cartItemsJson = prefs.getString('cartItems');
//     if (cartItemsJson != null) {
//       _cartItems.addAll(List<List<dynamic>>.from(jsonDecode(cartItemsJson)));
//       notifyListeners();
//     }
//     final popularItemsJson = prefs.getString('popularItemsList');
//     if (popularItemsJson != null) {
//       _popularItemsList
//           .addAll(List<List<dynamic>>.from(jsonDecode(popularItemsJson)));
//       notifyListeners();
//     }
//   }
// }
