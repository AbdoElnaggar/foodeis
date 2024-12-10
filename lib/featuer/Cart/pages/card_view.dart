// ignore_for_file: avoid_unnecessary_containers, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_import
import 'package:flutter/material.dart';
import 'package:graduate_app/core/constant/category.dart';
import 'package:graduate_app/featuer/Cart/data/model/product_model.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Consumer<Cartmodel>(builder: (context, value, child) {
        return Column(
          children: [
            Expanded(
              child: value.cartItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: value.cartItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.asset(value.cartItems[index][0]),
                          title: Text(value.cartItems[index][1]),
                          subtitle: Text(value.cartItems[index][2]),
                          trailing: InkWell(
                            onTap: () {
                              value.removeItem(index); // Update to remove the correct item
                            },
                            child: Icon(Icons.remove),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: LottieBuilder.asset('assets/image/loading.json'),
                    ),
            ),
          ],
        );
      }),
    );
  }
}
















