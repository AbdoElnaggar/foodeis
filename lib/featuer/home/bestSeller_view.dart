// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:graduate_app/core/utils/colors.dart';
import 'package:graduate_app/core/utils/style.dart';
import 'package:graduate_app/core/constant/category.dart';

class BestsellerView extends StatefulWidget {
  const BestsellerView({super.key});

  @override
  State<BestsellerView> createState() => _BestsellerViewState();
}

class _BestsellerViewState extends State<BestsellerView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        
        ),
        body: Container(
        
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text('Best Seller',style: getbodyStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            ),
            Divider(
                color: Colors.black,
                height: 20,
                thickness: 2,
                indent: 20,
                endIndent: 20),
                Gap(20),
            SizedBox(
              height: 600,
              child: ListView.builder(
                
                 physics: ScrollPhysics(),
                  itemCount: BestSellerlist.length,
                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                               BestSellerlist[index].path,
                              height: 193,
                              width: 360,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:20),
                            child: Row(
                              
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Gap(10),
                                Text(
                                  textAlign: TextAlign.start,
                                   BestSellerlist[index].des,
                                  style: getbodyStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Gap(5),
                                SvgPicture.asset(
                                  'assets/image/shield-check.svg',
                                  height: 14,
                                  width: 13,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:20),
                            child: Row(
                              children: [
                                Gap(10),
                                Text(
                                   BestSellerlist[index].open,
                                  style: getbodyStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greencolor),
                                ),
                                Gap(5),
                                Text(
                                  ' Santa Nella, CA 95322',
                                  style: getbodyStyle(
                                      fontSize: 15, color: AppColors.text),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:20),
                            child: Row(
                              children: [
                                Gap(10),
                                Container(
                                  decoration: BoxDecoration(
                                   color: AppColors.primary,
                                   borderRadius: BorderRadius.circular(12)
                                  ),
                                  padding: EdgeInsets.all(8),
                                 
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/image/star.svg',
                                       
                                        height: 18,
                                        width: 18,
                                      ),
                                         Gap(3),
                                      Text( BestSellerlist[index].mark,style: getbodyStyle(color: Colors.white),),
                                    ],
                                  ),
                                ),
                              Gap(10),
                                Text(
                                  '1.5Km',
                                  style: getbodyStyle(
                                    fontWeight: FontWeight.bold, color: AppColors.text),
                                ),
                                    
                              Gap(10),
                                Text(
                                  'Free shipping',
                                  style: getbodyStyle(
                                    fontWeight: FontWeight.bold, color: AppColors.text),
                                ),
                                
                              ],
                            ),
                          ),
                          Gap(12)
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      ),
    );
  }
}