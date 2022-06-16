import 'package:flutter/material.dart';

class AppRouter{
  AppRouter._();
  static AppRouter appRouter =AppRouter._();
  GlobalKey<NavigatorState> navkey = GlobalKey<NavigatorState>();

  gotoPagewithReplacment(Widget routeName){
    navkey.currentState?.pushReplacement(MaterialPageRoute(builder: (r)=>routeName));
  }

  gotoPage(Widget routeName){
    navkey.currentState?.push(MaterialPageRoute(builder: (r)=>routeName));
  }

  goReplacement(Widget widget){
    navkey.currentState?.pushReplacement(MaterialPageRoute(builder: (x)=>widget));
  }
  back(){
    navkey.currentState?.pop();
  }
}