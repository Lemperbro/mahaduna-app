import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/modules/bottom_navigate/views/bottom_navigate_view.dart';

import 'app/routes/app_pages.dart';

void main() async{
   await dotenv.load(fileName: ".env");
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Ma'haduNa",
      home: BottomNavigateView(),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
    );
  }
}
