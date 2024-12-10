// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_app/core/constant/icons.dart';
import 'package:graduate_app/core/utils/colors.dart';
import 'package:graduate_app/featuer/Cart/pages/card_view.dart';
import 'package:graduate_app/featuer/home/home_view.dart';
import 'package:graduate_app/featuer/profile/profile.dart';
import 'package:graduate_app/featuer/search/search.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int selectedIndex = 0;

  List<Widget> pages = [
     const Home_view(),
     CardView(),
     SearchPage(),
      profile_view(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
       
//home
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsIcons.homeSvg),
            activeIcon: SvgPicture.asset(
              AssetsIcons.homeSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.primary, BlendMode.srcIn),
            ),
            label: 'Home',
          ),

          //card
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsIcons.cartSvg),
            activeIcon: SvgPicture.asset(
              AssetsIcons.cartSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.primary, BlendMode.srcIn),
            ),
            label: 'Cart',
          ),
          //search
           BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsIcons.searchSvg),
            activeIcon: SvgPicture.asset(
              AssetsIcons.searchSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.primary, BlendMode.srcIn),
            ),
            label: 'Cart',
          ),

          //profile
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsIcons.profileSvg),
              activeIcon: SvgPicture.asset(
                AssetsIcons.profileSvg,
                colorFilter: const ColorFilter.mode(
                    AppColors.primary, BlendMode.srcIn),
              ),
              label: 'Profile'),
          
        ],
      ),
    );
  }
}