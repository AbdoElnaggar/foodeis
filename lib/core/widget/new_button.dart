import 'package:flutter/material.dart';
import 'package:graduate_app/core/utils/colors.dart';
import 'package:graduate_app/core/utils/style.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width,
    this.hight,
    required this.text,
    required this.onPressed,
  });
  final double? width;
  final double? hight;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight ?? 50,
      width: width ?? 250,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: getbodyStyle( color: Colors.white),
          )),
    );
  }
}