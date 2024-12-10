// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, camel_case_types, must_be_immutable, unused_import
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:graduate_app/core/constant/category.dart';
import 'package:graduate_app/core/utils/colors.dart';
import 'package:graduate_app/core/utils/style.dart';
import 'package:graduate_app/featuer/Cart/data/model/product_model.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


class ItemDeatils extends StatefulWidget {
  String image;
  String name;
  String price;
  int currentIndex;
  int model;

  ItemDeatils({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.currentIndex,
    required this.model,
  });

  @override
  State<ItemDeatils> createState() => _ItemDeatilsState();
}

int changecolor = 2;
int count = 1;

class _ItemDeatilsState extends State<ItemDeatils> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<Cartmodel>(
          builder: (BuildContext context, Cartmodel value, Widget? child) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.name,
                    style: getbodyStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'A signature flame-grilled beef patty\ntopped with smoked bacon.',
                    textAlign: TextAlign.center,
                    style: getbodyStyle(
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                    width: 350,
                    height: 280,
                  ),
                  Gap(12),
                  Row(
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            changecolor = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: changecolor == 1 ? AppColors.primary : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'S',
                            style: getbodyStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Gap(15),
                      InkWell(
                        onTap: () {
                          setState(() {
                            changecolor = 2;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: changecolor == 2 ? AppColors.primary : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'M',
                            style: getbodyStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Gap(15),
                      InkWell(
                        onTap: () {
                          setState(() {
                            changecolor = 3;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: changecolor == 3 ? AppColors.primary : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'L',
                            style: getbodyStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Gap(20),
                  Row(
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            count == 1 ? count : count--;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffFFF0B3),
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            '-',
                            style: getbodyStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Gap(15),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(12),
                        child: Text(
                          count.toString(),
                          style: getbodyStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Gap(15),
                      InkWell(
                        onTap: () {
                          setState(() {
                            count++;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffFFF0B3),
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            '+',
                            style: getbodyStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Price',
                              style: getbodyStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              widget.price,
                              style: getbodyStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            if (widget.model == 0) {
                              // Assuming resturantlist[widget.currentIndex] is the current restaurant
                              Provider.of<Cartmodel>(context, listen: false)
                                  .addItem(widget.currentIndex);
                            } else {
                              // Assuming resturantlist[widget.currentIndex] is the current restaurant
                              Provider.of<Cartmodel>(context, listen: false)
                                  .addItempopular(widget.currentIndex);
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  'Added to cart successfully',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(child: Text('Add to Order')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


