// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_import, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:graduate_app/core/function/navigator.dart';
import 'package:graduate_app/core/utils/colors.dart';
import 'package:graduate_app/core/utils/style.dart';
import 'package:graduate_app/featuer/home/bestSeller_view.dart';
import 'package:graduate_app/core/constant/category.dart';

class best_seller extends StatelessWidget {
  const best_seller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
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
                  'Best Partners',
                  style:
                      getbodyStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: (){
                    push(context, BestsellerView());
                  },
                  child: Text('See all',
                      style:
                          getbodyStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                )
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
            height: 230,
            child: ListView.builder(
                itemCount: bestlist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                           bestlist[index].path,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Gap(10),
                            Text(
                              textAlign: TextAlign.start,
                               bestlist[index].des,
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
                        Row(
                          children: [
                            Gap(10),
                            Text(
                               bestlist[index].open,
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
                        Row(
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
                                  Text( bestlist[index].mark,style: getbodyStyle(color: Colors.white),),
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
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
