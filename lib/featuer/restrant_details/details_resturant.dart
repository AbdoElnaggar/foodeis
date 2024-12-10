// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, unused_import, avoid_unnecessary_containers, unused_label, body_might_complete_normally_nullable, dead_code, sort_child_properties_last, must_be_immutable, override_on_non_overriding_member, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:graduate_app/core/function/navigator.dart';
import 'package:graduate_app/core/utils/colors.dart';
import 'package:graduate_app/core/utils/style.dart';
import 'package:graduate_app/core/constant/category.dart';
import 'package:graduate_app/featuer/Cart/data/model/product_model.dart';
import 'package:graduate_app/featuer/home/widget/best_seller.dart';
import 'package:graduate_app/featuer/home/widget/home_banner.dart';
import 'package:graduate_app/featuer/restrant_details/item_deatils.dart';
import 'package:graduate_app/featuer/restrant_details/widget/StarbucsList.dart';
import 'package:provider/provider.dart';

class Resutrand_details extends StatefulWidget {
  String image;
  String name;
  final ResturantList restaurant; 
  Resutrand_details({super.key, required this.image, required this.name,required this.restaurant});

  @override
  State<Resutrand_details> createState() => _Resutrand_detailsState();

}


int changecolor = 1;
bool favourit = true;
String deorRe = 'delivar';
int popularornot=0;


class _Resutrand_detailsState extends State<Resutrand_details> {
  @override
  @override
  void initState() {
    super.initState();
   
  }
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(),
      
      body: SingleChildScrollView(
        
        child: Column(
          
          children: [
            SizedBox(
                height: 430,
                child: HomeBanner(
                  image: widget.image,
                  name: widget.name,
                )),

            Row(
              children: [
                Spacer(),
                InkWell(
                    onTap: () {
                      setState(() {
                        changecolor = 1;
                        deorRe = 'delivar';
                      });
                    },
                    child: Text(
                      'Delivary',
                      style: getbodyStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: changecolor == 1
                              ? AppColors.primary
                              : AppColors.text),
                    )),
                Spacer(),
                InkWell(
                    onTap: () {
                      setState(() {
                        changecolor = 0;
                        deorRe = 'review';
                      });
                    },
                    child: Text('Review',
                        style: getbodyStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: changecolor == 0
                                ? AppColors.primary
                                : AppColors.text))),
                Spacer(),
              ],
            ),

            // delivary item

            deorRe == 'delivar'
                ? Padding(
                    padding:
                        const EdgeInsets.only(left: 13, right: 13, bottom: 10),
                    child: Column(
                      children: [
                        //popular item
                        popular_item(),
                        Container(
                          margin: EdgeInsets.only(top: 12, right: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hot Burger Cobmo',
                                style: getbodyStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),

                              Text(
                                '& Fried Chicken',
                                style: getbodyStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Consumer<Cartmodel>(
                            builder: (BuildContext context, value, Widget? child) { 
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemCount:value.shopItems.length,             
                                           
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      children: [
                                        Gap(12),
                                        InkWell(
                                          onTap: () {
                                            
                                            popularornot=0;
                                            push(
                                                context,
                                                ItemDeatils(
                                                  model: popularornot,
                                                  image: value.shopItems[index][0],
                                                  name: value.shopItems[index][1],
                                                  price: value.shopItems[index][2], currentIndex: index, 
                                                  
                                                ));
                                          },
                                          child: Image.asset(
                                            value.shopItems[index][0],
                                            height: 100,
                                            width: 100,
                                          ),
                                        ),
                                        Gap(25),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                               
                                                Text(value.shopItems[index][1]),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(value.shopItems[index][2]),
                                                Gap(30),
                                                InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        favourit = !favourit;
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.favorite,
                                                      color: favourit
                                                          ? AppColors.primary
                                                          : AppColors.text,
                                                    )),
                                              ],
                                            ),
                                            
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                            }
                          ),
                        ),
                      ],
                    ),
                  )
                :

                // review

                SingleChildScrollView(
                    child: Column(
                      children: [
                        // popular_item(),

                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: peopleReview.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 5),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          child: Image.asset(
                                            peopleReview[index].path,
                                            height: 40,
                                            width: 40,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        Gap(10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              peopleReview[index].name,
                                              style: getbodyStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.text),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.stars_rounded,
                                                  size: 16,
                                                  color: AppColors.primary,
                                                ),
                                                Icon(
                                                  Icons.stars_rounded,
                                                  size: 16,
                                                  color: AppColors.primary,
                                                ),
                                                Icon(
                                                  Icons.stars_rounded,
                                                  size: 16,
                                                  color: AppColors.primary,
                                                ),
                                                Icon(
                                                  Icons.stars_rounded,
                                                  size: 16,
                                                  color: AppColors.primary,
                                                ),
                                                Icon(
                                                  Icons.stars_rounded,
                                                  size: 16,
                                                  color: AppColors.primary,
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Text(
                                        style: getbodyStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        peopleReview[index].reviewtext),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.favorite,
                                              color: AppColors.primary,
                                              size: 20,
                                            ),
                                            Text(
                                              peopleReview[index].kindfood,
                                              style: getbodyStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Icon(Icons.flag),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      height: 10,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

//popular item
class popular_item extends StatelessWidget {
  const popular_item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  'Popular Item',
                  style:
                      getbodyStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: Consumer<Cartmodel>(
              builder: (BuildContext context, value, Widget? child) { 
                return    ListView.builder(
                  
                  itemCount:value.popularitems.length,
                  // value.popularItems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    
                    return InkWell(
                      onTap: () {
                        popularornot=1;
                        push(
                            context,
                            ItemDeatils(
                              image: value.popularitems[index][0],
                              name: value.popularitems[index][1],
                              price: value.popularitems[index][2], 
                              currentIndex: index,
                              model: popularornot,
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                               value.popularitems[index][0],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                             value.popularitems[index][1],
                              style: getbodyStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                           
                            Row(
                              children: [
                                Text(
                                 value.popularitems[index][2],
                                  style: getbodyStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greencolor),
                                ),
                                Gap(12),
                                Text(
                                  'Burger',
                                  style: getbodyStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
                   },
            ),
          )
        ],
      ),
    );
  }
}
