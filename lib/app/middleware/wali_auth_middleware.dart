import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';

class WaliAuthMiddleware extends GetMiddleware{
  @override
  int? get priority => 1;
  GetStorage getStorage = GetStorage('wali');

  @override
  RouteSettings? redirect(String? route){
    final authKey = getStorage.read('authKey');
    if(authKey == null){
      return RouteSettings(name: Routes.BOTTOM_NAVIGATE, arguments: {'index': 2});
    }else{
      //jika sudah login return null , biar kan dia lanjut ke halaman yang butuh auth
      return null;
    }
  }

}