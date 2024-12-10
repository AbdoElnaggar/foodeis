class OnboardingModel {
  final String image;
  final String title;
  final String description;
  OnboardingModel({required this.image,required this.title,required this.description});
}

List<OnboardingModel> pages=[

OnboardingModel(image:'assets/image/Group.png' ,
 title: 'Diverse & sparkling food.', 
 description: 'We use the best local ingredients to create fresh and delicious food and drinks.'),


OnboardingModel(image:'assets/image/Frame.png' ,
 title: 'Free shipping on all orders', description: 
 'Free shipping on the primary order whilst the usage of CaPay fee method.'),


OnboardingModel(image:'assets/image/Group (1).png' ,
 title: '+24K Restaurants',
  description: 'Easily find your favorite food and have it delivered in record time.'),

];