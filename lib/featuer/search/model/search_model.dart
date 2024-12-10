// ignore_for_file: prefer_final_fields, override_on_non_overriding_member, unused_element
import 'package:flutter/material.dart';

class SearchModel extends ChangeNotifier {
  final List<Map<String, String>> _allItems = [
    {'image': 'assets/image/search1.png', 'name': 'Burger King', 'price': '\$1.00'},
    {'image': 'assets/image/search2.png', 'name': 'Fride chicken', 'price': '\$0.50'},
    {'image': 'assets/image/search3.png', 'name': 'Burger', 'price': '\$2.00'},
    {'image': 'assets/image/search4.png', 'name': 'Burger', 'price': '\$3.00'},
    {'image': 'assets/image/search5.png', 'name': 'Burger', 'price': '\$5.00'},
    {'image': 'assets/image/search6.png', 'name': 'Starbucs', 'price': '\$40.00'},
    {'image':'assets/image/popular1.png','name': 'Combo spicy tender', 'price':'\$10.15'},
    {'image':'assets/image/popular1.png', 'name':'Combo Tender Grill','price': '\$10'},
    {'image':'assets/image/burgerKing.png', 'name':'Combo BBQ Bacon ', 'price':'\$22'}, 
    {'image':'assets/image/chicken.png', 'name':'Chicken BBQ', 'price':'\$10.15'},
    {'image':'assets/image/chicken2.png', 'name':'Combo Chicken Crispy ','price': '\$10'},
    {'image':'assets/image/chicken3.png','name': 'Combo BBQ Bacon','price': '\$22'},
    {'image':'assets/image/popular1.png', 'name':'Extreme cheese f', 'price':'\$10.15'},
    {'image':'assets/image/popular2.png', 'name':'Singles BBQ bacon\ncheese burger','price': '\$10'},
    {'image':'assets/image/popular4.png', 'name':'Potato chip Burrger\ncheese', 'price':'\$22'},

    //starbucs
     {'image':'assets/image/Starbucs1.jpeg','name': 'Caramel Maccihiato','price': '\$22'},
    {'image':'assets/image/Starbucs2.jpeg', 'name':'ICED Caramel Maccihiato', 'price':'\$10.15'},
    {'image':'assets/image/Starbucs3.jpeg', 'name':'COFFEE FRAPPUCCINO','price': '\$10'},
    {'image':'assets/image/Starbucs4.jpeg', 'name':'MOCHA FRAPPUCCINO', 'price':'\$22'},
    {'image':'assets/image/Starbucs5.jpeg', 'name':'DOUBLE Caramel FRAPPUCCINO', 'price':'\$22'},

  ];

  List<Map<String, String>> _filteredItems = [];

  List<Map<String, String>> get filteredItems => _filteredItems;

  SearchModel() {
    _initialize();
  }

  void _initialize() {
    _filteredItems = List.from(_allItems);
    notifyListeners();
  }

  void searchItems(String query) {
    if (query.isEmpty) {
      _filteredItems = List.from(_allItems);
    } else {
      _filteredItems = _allItems
          .where((item) => item['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
