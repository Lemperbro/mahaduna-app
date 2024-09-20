import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogCustom {
  void dialogError({
    String title = 'Terjadi Kesalahan',
    String message = 'Tidak berhasil melakukan perintah',
    IconData icon = Icons.error,
    Color iconColor = Colors.red,
  }) {
    Get.defaultDialog(
      title: title,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 48.0,
          ),
          SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  void dialogSukses({
    String title = 'Sukses',
    String message = 'berhasil melakukan perintah',
    IconData icon = Icons.check_circle,
    Color iconColor = Colors.green,
  }) {
    Get.defaultDialog(
      title: title,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 48.0,
          ),
          SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
