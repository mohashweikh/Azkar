import 'package:azkar/Provider/muslimProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SplashScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) =>
        Provider.of<MuslimProvider>(context,listen: false).loadSections(context));
    return SafeArea(
        child: Image.asset(
          'assets/images/logoAzkar.png',
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ));
  }
}
