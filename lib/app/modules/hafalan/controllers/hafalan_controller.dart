import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahaduna_apps/app/models/monitoring/hafalan_model.dart';
import 'package:mahaduna_apps/app/repositori/monitoring_repositori.dart';

class HafalanController extends GetxController {
  final monitoringRepo = Get.put(MonitoringRepo());
  GetStorage getStorage = GetStorage('wali');
  late final authKey = getStorage.read('authKey');
  final santri = Get.arguments;

  final hafalanData = Rx<HafalanModel?>(null);
  final isLoadingHafalan = false.obs;
  final isLoadingLoadMore = false.obs;
  final dataError = Rx<Map<String, dynamic>?>(null);

  @override
  void onInit() {
    super.onInit();
    allHafalan();
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
    allHafalan();
  }

  void loadMore(int page) async {
    isLoadingLoadMore.value = true;
    try {
      var santriId = santri.santriId;
      var getData =
          await monitoringRepo.allHafalan(santriId, authKey, page: page);
      if ((getData is Map)) {
        if (getData.containsKey('error')) {
          dataError.value = {'error': true};
        }
      } else {
        getData.data!.insertAll(0, hafalanData.value!.data!);
        hafalanData.value = getData;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    } finally {
      isLoadingLoadMore.value = false;
    }
  }

  void allHafalan() async {
    isLoadingHafalan.value = true;
    try {
      var santriId = santri.santriId;
      var getData = await monitoringRepo.allHafalan(santriId, authKey);
      if ((getData is Map)) {
        if (getData.containsKey('error')) {
          dataError.value = {'error': true};
        }
      } else {
        hafalanData.value = getData;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    } finally {
      isLoadingHafalan.value = false;
    }
  }
}
