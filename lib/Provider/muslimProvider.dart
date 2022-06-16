import 'dart:convert';

import 'package:azkar/appRouter.dart';
import 'package:azkar/screens/home_screen.dart';
import 'package:azkar/screens/section_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import '../models/section_detail_model.dart';
import '../models/section_model.dart';

class MuslimProvider extends ChangeNotifier{
  SectionModel sectionModel=SectionModel(0, '', '');
  List<SectionModel> sections = [];
  List<SectionDetailModel> sectionDetails = [];
  loadSections(BuildContext context) async {
    DefaultAssetBundle.of(context)
        .loadString("assets/database/sections_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        SectionModel _section = SectionModel.fromJson(section);
        sections.add(_section);
      });
    }).catchError((error) {
      print(error);
    });
    AppRouter.appRouter.gotoPagewithReplacment(HomeScreen());
  }

  loadSectionDetail(BuildContext context) async {
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/database/section_details_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        SectionDetailModel _sectionDetail = SectionDetailModel.fromJson(section);
        if(_sectionDetail.sectionId == sectionModel.id) {
          sectionDetails.add(_sectionDetail);
        }

      });
    }).catchError((error) {
      print(error);
    });
  }
  onShare(BuildContext context,String text)async{
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
      text,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}