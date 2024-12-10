
// ignore_for_file: unused_element, annotate_overrides

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:graduate_app/core/constant/category.dart';
import 'package:graduate_app/core/function/navigator.dart';
import 'package:graduate_app/core/utils/colors.dart';
import 'package:graduate_app/core/utils/style.dart';
import 'package:graduate_app/core/widget/new_button.dart';
import 'package:graduate_app/featuer/auth/presentation/pages/login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile_view extends StatefulWidget {
  const profile_view({super.key});

  @override
  State<profile_view> createState() => _profile_viewState();
}

class _profile_viewState extends State<profile_view> {
  String path = '';
  String name = '';

  @override
  void initState() {
     super.initState();
      _loadImage(); 
      }
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 212, 212),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: 200,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: AppColors.primary,
                          backgroundImage: path.isNotEmpty
                              ? FileImage(File(path))
                              : const AssetImage('assets/image/person.png') as ImageProvider,
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                builder: (context) {
                                  return Container(
                                    padding: const EdgeInsets.all(20),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Gap(20),
                                        CustomButton(
                                          width: double.infinity,
                                          onPressed: () {
                                            pickImage(true);
                                            Navigator.pop(context);
                                          },
                                          text: 'Upload From Camera',
                                        ),
                                        const Gap(15),
                                        CustomButton(
                                          width: double.infinity,
                                          onPressed: () {
                                            pickImage(false);
                                            Navigator.pop(context);
                                          },
                                          text: 'Upload From Gallery',
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Icon(Icons.camera_alt, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Text('Philippe Troussier', style: getbodyStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
            Gap(20),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('General', style: getbodyStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  Divider(),
                  ListView.separated(
                    itemCount: profileinfo.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(profileinfo[index].icon),
                        title: Text(profileinfo[index].title),
                        subtitle: Text(profileinfo[index].subtitle),
                        trailing: Icon(profileinfo[index].tileicon),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(thickness: 2, indent: 10, endIndent: 3, color: Colors.grey);
                    },
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                pushAndRemoveUntil(context, Login_view());
              },
              child: Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text('Logout', style: getbodyStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Gap(12),
          ],
        ),
      ),
    );
  }

Future<void> _loadImage() async { 
  SharedPreferences prefs = await SharedPreferences.getInstance();
   setState(() { path = prefs.getString('imagePath') ?? '';
    }); }

Future<void> _saveImage(String imagePath) async { 
  SharedPreferences prefs = await SharedPreferences.getInstance(); 
  await prefs.setString('imagePath', imagePath); 
  }

  void pickImage(bool isCamera) {
     ImagePicker() .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery) .then((value)
      { 
        if (value != null) { setState(() { path = value.path;
         });
          _saveImage(value.path); 
         } }); }
}


//   void pickImage(bool isCamera) {
//     ImagePicker()
//         .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
//         .then((value) {
//       if (value != null) {
//         setState(() {
//           path = value.path;
//         });
//       }
//     });
//   }
// }





// // ignore_for_file: unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, dead_code, camel_case_types, sized_box_for_whitespace, avoid_unnecessary_containers, unnecessary_null_comparison

// import 'dart:ffi';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:gap/gap.dart';
// import 'package:graduate_app/core/constant/category.dart';
// import 'package:graduate_app/core/utils/colors.dart';
// import 'package:graduate_app/core/utils/style.dart';
// import 'package:graduate_app/core/widget/new_button.dart';
// import 'package:image_picker/image_picker.dart';


// class profile_view extends StatefulWidget {
//   const profile_view({super.key});

//   @override
//   State<profile_view> createState() => _profile_viewState();
// }
// String path='';
// String name='';
// class _profile_viewState extends State<profile_view> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 214, 212, 212),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text('Profile'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//              Center(
//                child: Container(
//                 color: Colors.white,
//                 width: double.infinity,
//                 height: 200,
//                 child:Column(
//                   children: [
//                   // CircleAvatar(
//                   //   radius: 80,
//                   //   backgroundImage: AssetImage('assets/image/person3.png',),
//                   // ),

//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: 100,
//                         backgroundColor: AppColors.primary,
//                         backgroundImage: (path != null)
//                             ? FileImage(File(path??" "))
//                             : const AssetImage('assets/user.png'),
//                       ),
//                       Positioned(
//                           bottom: 10,
//                           right: 10,
//                           child: InkWell(
//                             onTap: () {
//                               showModalBottomSheet(
//                                   context: context,
//                                   backgroundColor:
//                                       Theme.of(context).scaffoldBackgroundColor,
//                                   builder: (context) {
//                                     return Container(
//                                       padding: const EdgeInsets.all(20),
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color: Theme.of(context)
//                                               .scaffoldBackgroundColor),
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           const Gap(20),
//                                           CustomButton(
//                                               width: double.infinity,
//                                               onPressed: () {
//                                                 pickImage(true);
//                                                 Navigator.pop(context);
//                                               },
//                                               text: 'Upload From Camera'),
//                                           const Gap(15),
//                                           CustomButton(
//                                               width: double.infinity,
//                                               onPressed: () {
//                                                 pickImage(false);
//                                                 Navigator.pop(context);
//                                               },
//                                               text: 'Upload From Gallery'),
//                                         ],
//                                       ),
//                                     );
//                                   });
//                             },
                    
//                   Text('Philippe Troussier',style: getbodyStyle(fontSize: 20),),
//                     ],
//                       )
//                 ) ,
//                 ),
//              ),
          
//         Gap(20),
        
//             Container(
//               margin: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                  color: Colors.white,
//               ),
             
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Text('General',style: getbodyStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
//                Divider(),
//                   ListView.separated(
//                         itemCount: profileinfo.length,        
//                          shrinkWrap: true,
//                          physics: NeverScrollableScrollPhysics(),
//                         itemBuilder: (BuildContext context, int index) {
//                           Row(children: [
//                            Icon(Icons.clean_hands)
//                           ],);
//                           return ListTile(
                            
//                             leading: Icon(profileinfo[index].icon),
//                             title: Text(profileinfo[index].title),
//                             subtitle:Text(profileinfo[index].subtitle),
//                             trailing:  Icon(profileinfo[index].tileicon),
                            
                            
//                           );
//                           SizedBox(height: 10,);
//                         }, separatorBuilder: (BuildContext context, int index) { 
//                           return Divider(thickness: 2,indent: 10,endIndent: 3,color: Colors.grey,);
//                          },
//                       ),
//                 ],
//               ),
//             ),
//           Container(
//             width: double.infinity,
//             height: 50,
//             margin: EdgeInsets.all(10),
            
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12)
//             ),
//             child: Center(child: Text('Logout',style: getbodyStyle(fontSize: 22,fontWeight: FontWeight.bold))),
//           ),
//           Gap(12),
//           ],
//         ),
//       ),
          
        
//     );

    
//   }

//     pickImage(bool isCamera) {
//     ImagePicker()
//         .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
//         .then((value) {
//       if (value != null) {
//         setState(() {
//           path = value.path;
//         });
//         // AppLocalStorage.cacheData(AppLocalStorage.kImage, path);
//       }
//     });
//   }
// }


// ignore_for_file: unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, dead_code, camel_case_types, sized_box_for_whitespace, avoid_unnecessary_containers, unnecessary_null_comparison
