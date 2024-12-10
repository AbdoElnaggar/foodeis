// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FoodSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> searchItems;

  FoodSearchDelegate({required this.searchItems});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Map<String, String>> matchQuery = [];
    for (var item in searchItems) {
      if (item['name']!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          leading: Image.asset(result['image']!),
          title: Text(result['name']!),
          subtitle: Text(result['price']!),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, String>> matchQuery = [];
    for (var item in searchItems) {
      if (item['name']!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          leading: Image.asset(result['image']!),
          title: Text(result['name']!),
          subtitle: Text(result['price']!),
        );
      },
    );
  }
}

