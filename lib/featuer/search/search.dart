// ignore_for_file: avoid_unnecessary_containers, camel_case_types, prefer_const_constructors, use_key_in_widget_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:graduate_app/featuer/search/model/food_search.dart';
import 'package:graduate_app/featuer/search/model/search_model.dart';
import 'package:provider/provider.dart';


class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Page'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                final searchModel = Provider.of<SearchModel>(context, listen: false);
                showSearch(
                  context: context,
                  delegate: FoodSearchDelegate(searchItems: searchModel.filteredItems),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Consumer<SearchModel>(
                  builder: (context, searchModel, child) {
                    return searchModel.filteredItems.isNotEmpty
                        ? ListView.builder(
                            itemCount: searchModel.filteredItems.length,
                            itemBuilder: (context, index) {
                              final item = searchModel.filteredItems[index];
                              return ListTile(
                                leading: Image.asset(item['image']!),
                                title: Text(item['name']!),
                                subtitle: Text(item['price']!),
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              'No results found',
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






