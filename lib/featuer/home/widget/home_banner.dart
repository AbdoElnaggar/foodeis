// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_escapes, unused_import, must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:graduate_app/core/utils/colors.dart';
import 'package:graduate_app/core/utils/style.dart';
import 'package:graduate_app/featuer/restrant_details/details_resturant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBanner extends StatefulWidget {
String image;
String name;
    HomeBanner({super.key,required this.image,required this.name});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}
int selectedBanner=0;
class _HomeBannerState extends State<HomeBanner> {
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      
       child: Scaffold(
        backgroundColor: Colors.white,
         body:  Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
                    child: CarouselSlider.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    widget.image
                                    // 'assets/image/kfc.png'
                                    ,
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                        options: CarouselOptions(
                          height: 150,
                          viewportFraction: 1,
                          initialPage: 0,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (value, reason) {
                            setState(() {
                               selectedBanner = value;
                            });
                          },
                          scrollDirection: Axis.horizontal,
                        )),
                  ),
                  const Gap(16),
                  SmoothPageIndicator(
                      controller: PageController(initialPage: selectedBanner),
                      count: 4,
                      effect: const ExpandingDotsEffect(
                          dotHeight: 7,
                          expansionFactor: 7,
                          radius: 7,
                          dotWidth: 7,
                          dotColor: AppColors.text,
                          activeDotColor:
                              AppColors.primary), // your preferred effect
                      onDotClicked: (index) {}),
                       Gap(15),
                      Padding(
                            padding: const EdgeInsets.only(left:20),
                            child: Row(
                              
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Gap(10),
                                Text(
                                  textAlign: TextAlign.start,
                                   widget.name,
                                  style: getbodyStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Gap(5),
                                SvgPicture.asset(
                                  'assets/image/shield-check.svg',
                                  height: 14,
                                  width: 13,
                                ),
                 Spacer(flex: 3,),
                                Text(
                                  textAlign: TextAlign.start,
                                   'TakeAway',
                                  style: getbodyStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold,color: AppColors.primary),
                                ),
Spacer(),
                                Icon(Icons.favorite,color: AppColors.primary,),
                                Spacer(),

                              ],
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(left:20),
                            child: Row(
                              children: [
                                Gap(10),
                                Text(
                                   'open',
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
Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1,
                indent: 20,
                endIndent: 20),

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
                                      Text( '4.5',style: getbodyStyle(color: Colors.white),),
                                    ],
                                  ),
                                ),
                              Spacer(),
                                Text(
                                  '1.5 Mins',
                                  style: getbodyStyle(
                                    fontWeight: FontWeight.bold, color: AppColors.text),
                                ),
                                    
                              Spacer(),
                                Text(
                                  '\$ Free shipping',
                                  style: getbodyStyle(
                                    fontWeight: FontWeight.bold, color: AppColors.text),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.all(12),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.formfield,
                              borderRadius: BorderRadius.circular(14)
                            ),
                            child: Center(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('\%',style: getbodyStyle(color: AppColors.primary,fontSize: 18),),
                               Gap(30),
                                Text('Save \$15.00 with code Total Dish',style: getbodyStyle(fontSize: 18),),
                              ],
                            ),),
                          ),

                          Divider(
                color: Colors.grey,
                height: 10,
                thickness: 1,
                indent: 20,
                endIndent: 20),
                ],
              ),
       ),
     );
  }
}