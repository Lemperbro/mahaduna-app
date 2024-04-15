import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pondok_controller.dart';

class PondokView extends GetView<PondokController> {
  const PondokView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PondokView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PondokView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
