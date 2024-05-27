import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';

class SnackBarCustom {
  void snackSuccess(
      {String title = 'Sukses',
      String message = 'Operasi telah berhasil dijalankan'}) {
    Get.snackbar(
      title,
      message,
      barBlur: 1,
      backgroundColor: Color(
        ConfigColor.appBarColor1,
      ),
      colorText: Colors.white,
      icon: Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 32,
      ),
      duration: Duration(seconds: 4),
    );
  }

  void snackError(
      {String title = 'Kesalahan',
      String message = 'Terjadi kesalahan, silakan coba lagi'}) {
    Get.snackbar(
      title,
      message,
      barBlur: 1,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      icon: Icon(
        Icons.error,
        color: Colors.white,
        size: 32,
      ),
      duration: Duration(seconds: 4),
    );
  }
}
