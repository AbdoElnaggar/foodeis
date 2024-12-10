


// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_import, non_constant_identifier_names, unused_local_variable, use_build_context_synchronously, camel_case_types, library_private_types_in_public_api

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_app/core/widget/nav_bar.dart';
import 'package:graduate_app/featuer/auth/data/block/Auth_block.dart';
import 'package:graduate_app/featuer/auth/presentation/pages/login.dart';
import 'package:graduate_app/featuer/Cart/data/model/product_model.dart';
import 'package:graduate_app/featuer/home/home_view.dart';
import 'package:graduate_app/featuer/onboarding/pages/onboarding.dart';
import 'package:graduate_app/featuer/search/model/search_model.dart';
import 'package:graduate_app/featuer/search/search.dart';
import 'package:graduate_app/featuer/upload/upload_view.dart';
import 'package:graduate_app/firebase_options.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Import your CartProvider

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
  } 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)  {

    return 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cartmodel()),
         ChangeNotifierProvider(create: (context) => SearchModel()),
         BlocProvider(create: (context) => AuthBlock()),
      ],
      child:
       MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Onboarding(),
             ),
    );
  }
}

class SplashScreen extends StatefulWidget {
   @override _SplashScreenState createState() => _SplashScreenState();
    } class _SplashScreenState extends State<SplashScreen> {
       @override void initState() { 
        super.initState(); _checkLoginStatus();
         } Future<void> _checkLoginStatus() async {
           SharedPreferences prefs = await SharedPreferences.getInstance(); 
           bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
            if (isLoggedIn) {
               Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => Home_view()), );
                } 
                else { 
                  Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => Onboarding()), ); 
                  } } @override Widget build(BuildContext context)
                   {
                     return Scaffold( body: Center(child: CircularProgressIndicator()) ); 
                     } }












