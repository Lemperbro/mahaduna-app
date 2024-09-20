import 'dart:async';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/data/artikel_provider.dart';


class ArtikelReadController extends GetxController {

  final _artikelProvider = ArtikelProvider();
  final arguments = Get.arguments;



  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _timer?.cancel();
  }

  void startTimer() {
    _timer = Timer(Duration(seconds: 30), () {
      addViewer();
    });
  }

  void addViewer() async {
    var slug = arguments.slug;
    await _artikelProvider.addViewer(slug);
  }

}
