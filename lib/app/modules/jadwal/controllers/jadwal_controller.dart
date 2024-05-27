import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mahaduna_apps/app/models/jadwal/jadwal_model.dart';
import 'package:mahaduna_apps/app/repositori/jadwal_repositori.dart';

class JadwalController extends GetxController {
  final jadwalRepo = Get.put(JadwalRepo());

  final isLoadingJadwal = true.obs;
  final jadwalSekarangData = Rx<JadwalModel?>(null);
  final jadwalData = Rx<JadwalModel?>(null);
  final jadwalErr = Rx<Map<String, dynamic>?>(null);

  final timeNow = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(Duration(seconds: 1), (timer) {
      timeNow.value = DateTime.now();
    });
  }

  @override
  void onReady() {
    super.onReady();
    allJadwal();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future refreshPage() async {
    allJadwal();
  }

  void cariJadwalSekarang(DateTime jamSekarang) {
    var now = DateFormat.Hms().format(DateTime(
        1970, 1, 1, jamSekarang.hour, jamSekarang.minute, jamSekarang.second));
    var jamNow = DateFormat.Hms().parse(now);
    if (jadwalData.value != null) {
      var jadwalSesuai = jadwalData.value!.data!.firstWhere((jadwal) {
        var startTime = DateFormat.Hms().parse(jadwal.startTime!);
        var endTime = DateFormat.Hms().parse(jadwal.endTime!);
        return startTime.isBefore(jamNow) && endTime.isAfter(jamNow);
      }, orElse: () => Datum());

      jadwalSekarangData.value = JadwalModel(data: [jadwalSesuai]);
    }
  }

  void allJadwal() async {
    isLoadingJadwal.value = true;
    try {
      var getJadwal = await jadwalRepo.allJadwal();
      if (!(getJadwal is JadwalModel)) {
        if (getJadwal.containsKey('error')) {
          jadwalErr.value = getJadwal;
        }
      } else {
        jadwalData.value = getJadwal;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    } finally {
      isLoadingJadwal.value = false;
    }
  }
}
