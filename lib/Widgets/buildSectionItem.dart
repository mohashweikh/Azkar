import 'package:azkar/Provider/muslimProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../appRouter.dart';
import '../models/section_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/section_detail_screen.dart';

class buildSectionItem extends StatelessWidget {
  SectionModel model;
   buildSectionItem(this.model);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<MuslimProvider>(context,listen: false).sectionModel=model;
        Provider.of<MuslimProvider>(context,listen: false).loadSectionDetail(context);
        AppRouter.appRouter.gotoPage(SectionDetailScreen());
      },
      child: Stack(
        children: [
          Container(
            margin:  EdgeInsets.only(top: 10.h),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.withOpacity(.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0 , 3),
                  )
                ],
                image: DecorationImage(image: AssetImage("assets/images/Capture.PNG"),fit: BoxFit.cover)),
          ),
          Positioned(
              left: 0.w,
              bottom: 7.h,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Text(
                  "${model.name}",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
