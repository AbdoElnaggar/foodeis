// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_null_comparison, use_build_context_synchronously, unused_field, prefer_const_constructors_in_immutables, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:graduate_app/core/function/dialog.dart';
import 'package:graduate_app/core/function/email_vaildead.dart';
import 'package:graduate_app/core/function/navigator.dart';
import 'package:graduate_app/core/utils/colors.dart';
import 'package:graduate_app/core/utils/style.dart';
import 'package:graduate_app/core/widget/custom_button.dart';
import 'package:graduate_app/core/widget/nav_bar.dart';
import 'package:graduate_app/featuer/auth/data/block/Auth_Event.dart';
import 'package:graduate_app/featuer/auth/data/block/Auth_block.dart';
import 'package:graduate_app/featuer/auth/data/block/Auth_state.dart';
import 'package:graduate_app/featuer/auth/presentation/pages/register.dart';

class Login_view extends StatefulWidget {
   Login_view({super.key});

  @override
  State<Login_view> createState() => _Login_viewState();
 
}

class _Login_viewState extends State<Login_view> {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displaypassword = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<AuthBlock,AuthState>(
          listener: (BuildContext context, state) { 
            if(state is LoginLoadinState){
            showLoadingDialog(context);
          }
          else if(state is LoginSuccesState){
            Navigator.pop(context);
            pushAndRemoveUntil(context, NavBarWidget());
          }
          else if(state is AuthErrorState){
            Navigator.pop(context);
            showErrorDialog(context, state.error);
          }
          else{
            Navigator.pop(context);
            showErrorDialog(context, 'Something error ocurred');
          }
           },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
             key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  SvgPicture.asset(
                    'assets/image/Logo.svg',
                    width: 150,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    'Welcome Back',
                    style: getbodyStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    'Hello Jos, sign in to continue!',
                    style: getbodyStyle(fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Or ',
                        style: getbodyStyle(fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          push(context, Register_view());
                        },
                        child: Text(
                          'Create new account',
                          style:
                              getbodyStyle(fontSize: 16, color: AppColors.primary),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  TextFormField(
                    validator: (value) {
                              if(value!.isEmpty)return 'enter email';
                              else if(!emailValidate(value)){
                                return 'Enter Correct email';
                              }
                              else{
                                return null;
                              }
                            },
                            controller: _emailController,
                    style: TextStyle(
                        decorationColor: Color(0XFFFFCC00), color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 205, 209, 223),
                      filled: true,
                      hintText: 'Enter your email',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  TextFormField(
                    validator:(value){
                              if(value!.isEmpty) return 'enter password';
                              return null;
                            },
                            controller: _displaypassword,
                    style: TextStyle(
                        decorationColor: Color(0XFFFFCC00), color: Colors.black),
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 205, 209, 223),
                      filled: true,
                      hintText: 'Enter your password',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  Gap(25),
                  InkWell(
                      onTap: () async {
                       if(_formKey.currentState!.validate()){
                        context.read<AuthBlock>().add(LoginEvent(
                          email: _emailController.text, 
                          password: _displaypassword.text));
                       }
                      },
                      child: custtom_button(
                        text: 'Sign in',
                      )),
                  Gap(12),
                  Text(
                    'Forget Password ?',
                    style: getbodyStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary),
                  ),
                  // Spacer(),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 130, 174, 231),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Spacer(),
                          SvgPicture.asset(
                            'assets/image/Facebook - Logo.svg',
                            width: 28,
                            height: 28,
                            fit: BoxFit.cover,
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Text(
                            'Connect with Facebook',
                            style: getbodyStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(22),
                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 130, 174, 231),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Spacer(),
                          Image.asset(
                            'assets/image/Google - Logo.png',
                            width: 28,
                            height: 28,
                            fit: BoxFit.cover,
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Text(
                            'Connect with Google',
                            style: getbodyStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
              
                  Spacer(),
                ],
              ),
            ),
          ),
        ));
  }
}
