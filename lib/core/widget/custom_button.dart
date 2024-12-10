// ignore_for_file: prefer_const_constructors, camel_case_types, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:graduate_app/core/utils/colors.dart';
import 'package:graduate_app/core/utils/style.dart';

class custtom_button extends StatelessWidget {
   custtom_button({super.key,required this.text});
final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
                    width: double.infinity, 
                    margin: EdgeInsets.only(top: 22),
                    height: 55,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(child: Text(text,style: getbodyStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),
                  );
  }
}