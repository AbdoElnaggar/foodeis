// ignore_for_file: prefer_const_constructors, camel_case_types, unused_field, body_might_complete_normally_nullable, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:graduate_app/featuer/auth/presentation/pages/login.dart';

class Register_view extends StatefulWidget {
  const Register_view({super.key});

  @override
  State<Register_view> createState() => _Register_viewState();
}

class _Register_viewState extends State<Register_view> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBlock,AuthState>(
        listener: (BuildContext context, state) {
          if(state is RegisterLoadinState){
            showLoadingDialog(context);
          }
          else if(state is RegisterSuccesState){
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
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
                  child: IntrinsicHeight(
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
                          'Hello! Create Account',
                          style: getbodyStyle(fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: getbodyStyle(fontSize: 16),
                            ),
                            InkWell(
                              onTap: (){
                                push(context, Login_view());
                              },
                              child: Text(
                                 'Sign in',
                                style: getbodyStyle(fontSize: 16, color: AppColors.primary),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        TextFormField(
                          controller: _displayName,
                          style: TextStyle(
                            
                              decorationColor: Color(0XFFFFCC00), color: Colors.black),
                          decoration: InputDecoration(
                            fillColor: const Color.fromARGB(255, 205, 209, 223),
                            filled: true,
                           hintText: 'UserName',
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none),
                          ),
                          validator: (value) {
                            if(value!.isEmpty)return 'plealse enter name';
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _emailController,
                          style: TextStyle(
                          
                              decorationColor: Color(0XFFFFCC00), color: Colors.black),
                          decoration: InputDecoration(
                            fillColor: const Color.fromARGB(255, 205, 209, 223),
                            filled: true,
                            hintText: 'Enter your emial',
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none),
                          ),
                          validator: (value) {
                            if(value!.isEmpty)return 'enter email';
                            else if(!emailValidate(value)){
                              return 'Enter Correct email';
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                        controller: _passwordController,
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
                          validator:(value){
                            if(value!.isEmpty) return 'enter password';
                            return null;
                          },
                        ),
                        Gap(15),
                        InkWell(
                          onTap: () async{
                               
                                if(_formKey.currentState!.validate()){
                                  context.read<AuthBlock>().add(RegisterEvent(
                                    name: _displayName.text, 
                                    password: _passwordController.text,
                                     email: _emailController.text));
                                }
                              },
                          child: custtom_button(text: 'Register', )),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
