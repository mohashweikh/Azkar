import 'dart:io';

import 'package:azkar/Provider/muslimProvider.dart';
import 'package:azkar/Widgets/buildSectionItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<MuslimProvider>(context,listen: false).loadSectionDetail(context);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              SystemNavigator.pop();
            }, icon: Icon(Icons.exit_to_app,size: 35.sp,)),
            SizedBox(width: 5.w,)
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.green,
                  Colors.black.withOpacity(0.5)
                ],
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png',width: 45.w,height: 45.h,),
              SizedBox(width: 10.w,),
              Text("أذكار المسلم",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.sp,),),
            ],
          ),
        ),
        body: Consumer<MuslimProvider>(
          builder: (context, provider, v) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/cvb.PNG"),
                fit: BoxFit.cover,
              ),
            ),
            margin:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
              ),
              itemBuilder: (context, index) =>
                  buildSectionItem( provider.sections[index]),
              itemCount: provider.sections.length,
            ),
          ),
        ),
      ),
    );
  }
}
