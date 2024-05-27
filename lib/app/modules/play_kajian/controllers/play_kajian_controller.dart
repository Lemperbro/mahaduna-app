import 'package:get/get.dart';
import 'package:mahaduna_apps/app/models/kajian/find_video_model.dart';
import 'package:mahaduna_apps/app/repositori/kajian_repositori.dart';

class PlayKajianController extends GetxController {
  final kajianRepo = Get.put(KajianRepo());
  final isLoadingFindVideo = true.obs;
  final findVideoData = Rx<FindVideoModel?>(null);
  final findVideoErr = Rx<Map<String, dynamic>?>(null);

  late final videoId;
  @override
  void onInit() {
    
    super.onInit();
    videoId = Get.arguments['videoId'];
  }

  @override
  void onReady() {
    super.onReady();
    findDetailVideo();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void findDetailVideo() async {
    isLoadingFindVideo.value = true;
    if (videoId == null) {
      Get.back();
      Future.delayed(Duration(milliseconds: 500), () {
        Get.snackbar('Informasi', 'Video sedang tidak bisa dibuka');
      });
    }

    try {
      var findVideo = await kajianRepo.findDetailVideo(videoId);
      if (!(findVideo is FindVideoModel)) {
        if (findVideo.containsKey('error')) {
          findVideoErr.value = findVideo;
        }
      } else {
        findVideoData.value = findVideo;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    } finally {
      isLoadingFindVideo.value = false;
    }
  }
}
