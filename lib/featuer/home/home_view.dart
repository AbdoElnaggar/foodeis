// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, unused_import, sized_box_for_whitespace, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:graduate_app/core/function/navigator.dart';
import 'package:graduate_app/core/utils/colors.dart';
import 'package:graduate_app/core/utils/style.dart';
import 'package:graduate_app/featuer/restrant_details/details_resturant.dart';
import 'package:graduate_app/featuer/home/widget/best_seller.dart';
import 'package:graduate_app/core/constant/category.dart';

class Home_view extends StatefulWidget {
  const Home_view({super.key});

  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: const Color.fromARGB(255, 204, 197, 197),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //search
              Container(
                height: 210,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Spacer(),
                    TextFormField(
                      style: TextStyle(
                          decorationColor: Color(0XFFFFCC00),
                          color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 225, 226, 230),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        hintText: 'Search On Coody',
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    Gap(15),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Delivery to',
                              style: getbodyStyle(
                                  color: AppColors.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '1014 Prospect vall',
                              style: getbodyStyle(fontSize: 14),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 80,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromARGB(255, 225, 226, 230)),
                          child: Row(
                            children: [
                              Icon(Icons.settings),
                              Text(
                                ' Filter',
                                style: getbodyStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Spacer()
                  ],
                ),
              ),
      
              Gap(20),
              //category
              Container(
                height: 230,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category',
                            style: getbodyStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text('See all',
                              style: getbodyStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                        color: Colors.black,
                        height: 20,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                          itemCount: category.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(right: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    category[index].path,
                                  ),
                                  Text(
                                    category[index].des,
                                    style: getbodyStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              //best seller
              Gap(20),
              //  BestSeller(),
      
              best_seller(),
      
               Gap(20),
      //resturant
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: resturantlist.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 300,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final restaurant = resturantlist[index];
                    return GestureDetector(
                      onTap: () {
                        push(context,
                            Resutrand_details(image: resturantlist[index].path,name: resturantlist[index].name, restaurant: restaurant,  ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                   resturantlist[index].path,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  
                                  ),
                                )),
                                   Gap(8),
                                Row(
                                  children: [
                                    Text( resturantlist[index].name,style: getbodyStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                    Gap(10),
                                    SvgPicture.asset('assets/image/shield-check.svg'),
                                  
                                  ],
                                ),
                    
                    
                                 Row(
                                  children: [
                                    Text( resturantlist[index].open,style: getbodyStyle(color:AppColors.greencolor,fontSize: 16,fontWeight: FontWeight.w600),),
                                    Gap(10),
                                   Text( resturantlist[index].kindfood,style: getbodyStyle(color: AppColors.text),),
                                  
                                  ],
                                ),
                          
                          
                          ],
                        ),
                      ),
                    );
                }),
            ),
              Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
