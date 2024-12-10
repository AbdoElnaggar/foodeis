// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:graduate_app/core/function/navigator.dart';
import 'package:graduate_app/core/utils/colors.dart';
import 'package:graduate_app/core/utils/style.dart';
import 'package:graduate_app/core/widget/custom_button.dart';
import 'package:graduate_app/featuer/auth/presentation/pages/login.dart';
import 'package:graduate_app/featuer/onboarding/pages/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  var pageController = PageController();
  int currentpage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
           
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: 3,
                  // onPageChanged: (value) {
                  //   setState(() {
                  //     currentpage==value;
                  //   });
                  // },
                  itemBuilder: (context,index){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Image.asset(pages[index].image),
                      Spacer(),
                      Text(pages[index].title,textAlign: TextAlign.center,style: getbodyStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                       Text(pages[index].description,textAlign: TextAlign.center,style: getbodyStyle(fontSize: 18),),
                   Spacer(),
                    ],
                  );
                  }
                  ),
              ),

                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: const WormEffect(
                    dotHeight: 8,
                    dotWidth: 16,
                    activeDotColor: AppColors.primary,
                    dotColor: AppColors.text,
                    spacing: 8,
                  ),
                ),
                

                InkWell(
                  onTap: (){
                   push(context,Login_view());
                  },
                  child: custtom_button(text: 'Get start',),
                ),
                
             
            ],
          ),
        ),
      ),
    );
  }
}