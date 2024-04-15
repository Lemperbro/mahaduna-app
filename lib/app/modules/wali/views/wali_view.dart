import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wali_controller.dart';

class WaliView extends GetView<WaliController> {
  const WaliView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WaliView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WaliView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
