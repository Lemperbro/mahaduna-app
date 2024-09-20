import 'package:get/get.dart';
import 'package:mahaduna_apps/app/models/majalah/majalah_all_model.dart';
import 'package:mahaduna_apps/app/repositori/majalah_repositori.dart';

class AddiyaController extends GetxController {
  final majalahRepo = Get.put(MajalahRepo());

  final isLoadingAddiya = true.obs;
  final isLoadingLoadMore = false.obs;
  final addiyaData = Rx<AllMajalahModel?>(null);
  final addiyaErr = Rx<Map<String, dynamic>?>(null);

  final sortBest =
      (Get.arguments is Map) && Get.arguments.containsKey('sortBest')
          ? Get.arguments['sortBest']
          : false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    allAddiya();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future refreshPage() async {
    allAddiya();
  }

  void loadMore(int? page) async {
    isLoadingLoadMore.value = true;
    try {
      var response = await majalahRepo.allMajalah(sortBest: sortBest, page: page);
      if (!(response is AllMajalahModel)) {
        if (response.containsKey('error')) {
          addiyaErr.value = response;
        }
      } else {
        response.data!.insertAll(0, addiyaData.value!.data!);
        addiyaData.value = response;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    } finally {
      isLoadingLoadMore.value = false;
    }
  }

  void allAddiya() async {
    isLoadingAddiya.value = true;
    try {
      var response = await majalahRepo.allMajalah(sortBest: sortBest);
      if (!(response is AllMajalahModel)) {
        if (response.containsKey('error')) {
          addiyaErr.value = response;
        }
      } else {
        addiyaData.value = response;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    } finally {
      isLoadingAddiya.value = false;
    }
  }
}
