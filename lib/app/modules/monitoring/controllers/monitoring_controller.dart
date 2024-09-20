import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahaduna_apps/app/models/monitoring/monitoring_model.dart';
import 'package:mahaduna_apps/app/repositori/monitoring_repositori.dart';

class MonitoringController extends GetxController {
  final monitoringRepo = Get.put(MonitoringRepo());
  GetStorage getStorage = GetStorage('wali');
  late final authKey = getStorage.read('authKey');
  final santri = Get.arguments['santri'];
  final kategori = Get.arguments['kategori'];

  final monitoringData = Rx<MonitoringModel?>(null);
  final isLoadingMonitoring = false.obs;
  final monitoringError = Rx<Map<String, dynamic>?>(null);

  @override
  void onInit() {
    super.onInit();
    allMonitoring();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future refreshPage() async {
    allMonitoring();
  }

  void failedRefresh() {
    isLoadingMonitoring.value = true;
    try {
      allMonitoring();
    } finally {
      isLoadingMonitoring.value = false;
    }
  }

  void allMonitoring() async {
    if (authKey != null) {
      var kategori = this.kategori;
      var santriId = this.santri.santriId;
      isLoadingMonitoring.value = true;
      try {
        var getData =
            await monitoringRepo.allMonitoring(kategori, santriId, authKey);
        if ((getData is Map)) {
          if (getData.containsKey('error')) {
            monitoringError.value = {'error': true};
          }
        } else {
          monitoringData.value = getData;
        }
      } catch (err) {
        Get.snackbar('error', 'Ada kesalahan sistem');
      } finally {
        isLoadingMonitoring.value = false;
      }
    }
  }
}
