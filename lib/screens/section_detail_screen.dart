import 'package:azkar/Provider/muslimProvider.dart';
import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

class SectionDetailScreen extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:   Colors.tealAccent.withOpacity(0.9),
        appBar: AppBar(
          backgroundColor:   Colors.tealAccent.withOpacity(0.1),
          elevation: 20,
          automaticallyImplyLeading: false,
          centerTitle: true,
          toolbarHeight: 200.h,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
             boxShadow: [
               BoxShadow(
                 color: Colors.black,
                 spreadRadius: 1,
                 blurRadius: 1,
                 offset: Offset(0,1), // changes position of shadow
               ),
             ],
             image: DecorationImage(
               image: AssetImage(Provider.of<MuslimProvider>(context,listen: false).sectionModel.img),
               fit: BoxFit.fill,
            ),
          ),),
        ),
        body: Scrollbar(
          isAlwaysShown: true,
          scrollbarOrientation: ScrollbarOrientation.right,
          thickness: 10.w,
            trackVisibility: true,
            radius: Radius.circular(15),
            showTrackOnHover: true,
            interactive: true,
            child: Consumer<MuslimProvider>(
            builder:(context,provider,inde)=>ListView.builder(
              itemBuilder: (context , index) {
                return  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.h,horizontal: 15.w),
                            child: Card(
                              child: ListTile(
                                selected: true,
                                leading: CircleAvatar(
                                  backgroundColor: Colors.tealAccent,
                                  child: Text('${provider.sectionDetails[index].count}',style: TextStyle(color: Colors.redAccent),),
                                ),
                                trailing: Text('.'+(index+1).toString(),style: TextStyle(fontSize: 20.sp,color: Colors.black),),
                                subtitle: Text("${provider.sectionDetails[index].description}", textDirection: TextDirection.rtl,style: TextStyle(
                                  color: Colors.pinkAccent

                                ),),
                                title: SelectableText("${provider.sectionDetails[index].content}" , textDirection: TextDirection.rtl,style: TextStyle(
                                  fontSize: 20.sp
                                ),),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5.h,
                            left: 20.w,
                            child:Builder(
                              builder: (context) {
                                return IconButton(
                                  onPressed: () => provider.onShare(context,provider.sectionDetails[index].content),
                                  icon: Icon(Icons.share),);
                              }
                            )
                          )
                        ],
                      ),
                     index== provider.sectionDetails.length-1?GestureDetector(
                       onTap: (){
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                           content: Text('تم بحمد الله قراءة '+provider.sectionModel.name),
                         ));
                         Navigator.of(context).pop();
                       },
                       child: CircleAvatar(
                         radius: 40,
                         backgroundColor: Colors.teal,
                         foregroundColor: Colors.white,
                         child: Icon(Icons.check,size: 40.sp,),
                       ),
                     ):Center()
                    ],

                );
              },
              itemCount: provider.sectionDetails.length
          ),
        ),
      ),
      ));
  }



}
