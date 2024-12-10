// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

class Category {
  final String path;
  final String des;
  Category({required this.path, required this.des});
}

List<Category> category = [
  Category(
    path: 'assets/image/Group 5 (1).svg',
    des: 'pizza',
  ),
  Category(
    path: 'assets/image/Group 5 (2).svg',
    des: 'Burgers',
  ),
  Category(
    path: 'assets/image/Group 5.svg',
    des: 'Sandwich',
  ),
  Category(
    path: 'assets/image/Group 5.svg',
    des: 'pizza',
  ),
];

//best seller

class BestPartenerList {
  final String path;
  final String des;
  final String open;
  final String mark;
  BestPartenerList(
      {required this.path,
      required this.des,
      required this.open,
      required this.mark});
}

List<BestPartenerList> bestlist = [
  BestPartenerList(
      path: 'assets/image/sandwitch.png',
      des: 'Subway',
      open: 'open',
      mark: '4.5'),
  BestPartenerList(
      path: 'assets/image/kfc.png', des: 'KFC', open: 'open', mark: '4.5'),
  BestPartenerList(
      path: 'assets/image/best2.png',
      des: 'Taco Bell',
      open: 'open',
      mark: '4.5')
];
//


class ResturantList {
  final String path;
  final String name;
  final String open;
  final String kindfood;
  final List<List<String>> specialProducts;
  final List<List<String>> popularItems; // List of popular items

  ResturantList({
    required this.path,
    required this.name,
    required this.open,
    required this.kindfood,
    required this.specialProducts,
    required this.popularItems,
  });
}

List<ResturantList> resturantlist = [
  //starbucs
  ResturantList(
    path: 'assets/image/starbucs.png',
    name: 'Starbucks',
    open: 'open',
    kindfood: 'FastFood',
    specialProducts: [
      ['assets/image/coffee.png', 'Coffee', '\$5'],
      ['assets/image/muffin.png', 'Muffin', '\$3'],
      ['assets/image/sandwich.png', 'Sandwich', '\$7'],
    ],
    popularItems: [
      ['assets/image/popular1.png', 'Pumpkin Spice Latte', '\$5'],
      ['assets/image/popular2.png', 'Iced Caramel Macchiato', '\$4.50'],
    ],
  ),
  //subway
  ResturantList(
    path: 'assets/image/subway.png',
    name: 'Subway',
    open: 'open',
    kindfood: 'FastFood',
    specialProducts: [
      ['assets/image/starbucs.png', 'Sub', '\$6'],
      ['assets/image/starbucs.png', 'Salad', '\$4'],
      ['assets/image/starbucs.png', 'Drink', '\$2'],
    ],
    popularItems: [
      ['assets/image/popular3.png', 'Italian B.M.T.', '\$7'],
      ['assets/image/popular4.png', 'Chicken Teriyaki', '\$6.50'],
    ],
  ),
  //burger king
  ResturantList(
      path: 'assets/image/burgerKing.png',
      name: 'Burger King',
      open: 'open',
      kindfood: 'FastFood', 
       specialProducts: [
      ['assets/image/starbucs.png', 'Sub', '\$6'],
      ['assets/image/starbucs.png', 'Salad', '\$4'],
      ['assets/image/starbucs.png', 'Drink', '\$2'],
    ],
    popularItems: [
      ['assets/image/popular3.png', 'Italian B.M.T.', '\$7'],
      ['assets/image/popular4.png', 'Chicken Teriyaki', '\$6.50'],
    ],
      ),
      //pizza hut
  ResturantList(
      path: 'assets/image/pizaahut.png',
      name: 'Pizzahut',
      open: 'open',
      kindfood: 'FastFood',
       specialProducts: [
      ['assets/image/starbucs.png', 'Sub', '\$6'],
      ['assets/image/starbucs.png', 'Salad', '\$4'],
      ['assets/image/starbucs.png', 'Drink', '\$2'],
    ],
    popularItems: [
      ['assets/image/popular3.png', 'Italian B.M.T.', '\$7'],
      ['assets/image/popular4.png', 'Chicken Teriyaki', '\$6.50'],
    ],
      ),
      //mac
  ResturantList(
      path: 'assets/image/Mac.png',
      name: 'McDonald’s',
      open: 'open',
      kindfood: 'FastFood',
       specialProducts: [
      ['assets/image/starbucs.png', 'Sub', '\$6'],
      ['assets/image/starbucs.png', 'Salad', '\$4'],
      ['assets/image/starbucs.png', 'Drink', '\$2'],
    ],
    popularItems: [
      ['assets/image/popular3.png', 'Italian B.M.T.', '\$7'],
      ['assets/image/popular4.png', 'Chicken Teriyaki', '\$6.50'],
    ],
      ),
      //tacobull
  ResturantList(
      path: 'assets/image/Tacobull.png',
      name: 'Taco Bell',
      open: 'open',
      kindfood: 'coffe',
       specialProducts: [
      ['assets/image/starbucs.png', 'Sub', '\$6'],
      ['assets/image/starbucs.png', 'Salad', '\$4'],
      ['assets/image/starbucs.png', 'Drink', '\$2'],
    ],
    popularItems: [
      ['assets/image/popular3.png', 'Italian B.M.T.', '\$7'],
      ['assets/image/popular4.png', 'Chicken Teriyaki', '\$6.50'],
    ],
      )
 
];

//resturant list

// class ResturantList {
//   final String path;
//   final String name;
//   final String open;
//   final String kindfood;
  
//   ResturantList(
//       {required this.path,
//       required this.name,
//       required this.open,
//       required this.kindfood});
// }

// List<ResturantList> resturantlist = [
//   ResturantList(
//       path: 'assets/image/starbucs.png',
//       name: 'Starbucks',
//       open: 'open',
//       kindfood: 'FastFood'),
//   ResturantList(
//       path: 'assets/image/subway.png',
//       name: 'Subway',
//       open: 'open',
//       kindfood: 'FastFood'),
//   ResturantList(
//       path: 'assets/image/burgerKing.png',
//       name: 'Burger King',
//       open: 'open',
//       kindfood: 'FastFood'),
//   ResturantList(
//       path: 'assets/image/pizaahut.png',
//       name: 'Pizzahut',
//       open: 'open',
//       kindfood: 'FastFood'),
//   ResturantList(
//       path: 'assets/image/Mac.png',
//       name: 'McDonald’s',
//       open: 'open',
//       kindfood: 'FastFood'),
//   ResturantList(
//       path: 'assets/image/Tacobull.png',
//       name: 'Taco Bell',
//       open: 'open',
//       kindfood: 'coffe')
// ];

//best seller all

class bestsellerlist {
  final String path;
  final String des;
  final String open;
  final String mark;
  bestsellerlist(
      {required this.path,
      required this.des,
      required this.open,
      required this.mark});
}

List<bestsellerlist> BestSellerlist = [
  bestsellerlist(
      path: 'assets/image/sandwitch.png',
      des: 'Subway',
      open: 'open',
      mark: '4.5'),
  bestsellerlist(
      path: 'assets/image/kfc.png', des: 'KFC', open: 'open', mark: '4.5'),
  bestsellerlist(
      path: 'assets/image/best2.png',
      des: 'Taco Bell',
      open: 'open',
      mark: '4.5'),
  bestsellerlist(
      path: 'assets/image/starbucs.png',
      des: 'Sturbus',
      open: 'open',
      mark: '4.5'),
  bestsellerlist(
      path: 'assets/image/burgerKing.png',
      des: 'BurgerKing',
      open: 'open',
      mark: '4.5'),
  bestsellerlist(
      path: 'assets/image/Mac.png',
      des: 'McDonald’s',
      open: 'open',
      mark: '4.5')
];

//popular time

class popular_item {
  final String path;
  final String name;
  final String open;
  final String kindfood;
  popular_item(
      {required this.path,
      required this.name,
      required this.open,
      required this.kindfood});
}

List<popular_item> popularlist = [
  popular_item(
      path: 'assets/image/starbucs.png',
      name: 'Starbucks',
      open: 'open',
      kindfood: 'FastFood'),
  popular_item(
      path: 'assets/image/subway.png',
      name: 'Subway',
      open: 'open',
      kindfood: 'FastFood'),
  popular_item(
      path: 'assets/image/burgerKing.png',
      name: 'Burger King',
      open: 'open',
      kindfood: 'FastFood'),
  popular_item(
      path: 'assets/image/pizaahut.png',
      name: 'Pizzahut',
      open: 'open',
      kindfood: 'FastFood'),
];

//popular time

class ReviewUser {
  final String path;
  final String name;
  final String reviewtext;
  final String kindfood;
  ReviewUser(
      {required this.path,
      required this.name,
      required this.reviewtext,
      required this.kindfood});
}

List<ReviewUser> peopleReview = [
  ReviewUser(
      path: 'assets/image/person.png',
      name: 'Eleanor Summers',
      reviewtext:
          'What can I say it\'s fast food, it\'s Burger King.No different to any of the other burger kings, nice with adequate seating',
      kindfood: '12 likes'),
  ReviewUser(
      path: 'assets/image/person2.png',
      name: 'Victoria Champain',
      reviewtext:
          'Food, as always, is good both upstairs and downstairs is always clean (download the bk app for deals etc.) sit upstairs every time, more relaxed feel.',
      kindfood: '132 likes'),
  ReviewUser(
      path: 'assets/image/person3.png',
      name: 'Laura Smith',
      reviewtext:
          'Amazing food. Lots of choice. We took a while to choose as everything sounded amazing on the menu! All cooked to perfection. Portions were large. Service excellent. Definitely plan to go again and often!',
      kindfood: '36 likes'),
  ReviewUser(
      path: 'assets/image/person3.png',
      name: 'Dora Perry',
      reviewtext:
          'I popped in for a late lunch on Friday after a long morning working. The staff member was rude and unhelpful and the toilets were closed. I will not be returning and suggest others do not either.',
      kindfood: '66 likes'),
];

//profile time

class profile {
  final IconData icon;
  final String title;
  final String subtitle;
  final IconData tileicon;
  profile(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.tileicon});
}

List<profile> profileinfo = [
  profile(
    icon: Icons.person,
    title: 'Account information',
    subtitle: 'Change your Account information',
    tileicon: Icons.arrow_back_ios,
  ),
  profile(
    icon: Icons.person,
    title: 'Password',
    subtitle: 'Change your Password',
    tileicon: Icons.arrow_back_ios,
  ),
  profile(
    icon: Icons.person,
    title: 'Delivery Locations',
    subtitle: 'Change your Delivery Locations',
    tileicon: Icons.arrow_back_ios,
  ),
  profile(
    icon: Icons.person,
    title: 'Invite your friends',
    subtitle: 'Get \$59 for each invitation!',
    tileicon: Icons.arrow_back_ios,
  ),
];

//popular time

class ProductModel extends ChangeNotifier {
  int id;
  final String path;
  final String name;
  final String price;

  ProductModel({
    required this.id,
    required this.path,
    required this.name,
    required this.price,
  });
}

List<ProductModel> productmodelList = [
  ProductModel(
    id: 1,
    path: 'assets/image/popular1.png',
    name: 'Extreme cheese f',
    price: '\$3.5',
  ),
  ProductModel(
    id: 2,
    path: 'assets/image/popular1.png',
    name: 'Singles BBQ bacon\ncheese burger',
    price: '\$3.5',
  ),
  ProductModel(
    id: 2,
    path: 'assets/image/popular1.png',
    name: 'Potato chip Burrger\ncheese',
    price: '\$10',
  ),
];
