import 'package:get/get.dart';
import 'package:mahaduna_apps/app/models/kajian/playlist_items_models.dart';
import 'package:mahaduna_apps/app/repositori/kajian_repositori.dart';

class PlaylistItemsController extends GetxController {
  final kajianRepo = Get.put(KajianRepo());
  final playlistId = Get.arguments['playlistId'];

  final isloadingPlaylistItems = true.obs;
  final isLoadingLoadmore = false.obs;
  final playlistItemsData = Rx<PlaylistItemsModel?>(null);
  final playlistItemErr = Rx<Map<String, dynamic>?>(null);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    allplaylistItems();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future refreshPage() async {
    allplaylistItems();
  }

  void allplaylistItems() async {
    isloadingPlaylistItems.value = true;
    if (playlistId == null) {
      Get.back();
      Future.delayed(Duration(milliseconds: 500), () {
        Get.snackbar('Informasi', 'Video sedang tidak bisa dibuka');
      });
    }
    try {
      var getPlaylistItems = await kajianRepo.playlistItems(playlistId);
      if (!(getPlaylistItems is PlaylistItemsModel)) {
        if (getPlaylistItems.containsKey('error')) {
          playlistItemErr.value = getPlaylistItems;
        }
      } else {
        playlistItemsData.value = getPlaylistItems;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    } finally {
      isloadingPlaylistItems.value = false;
    }
  }

  void loadMoreItems(dynamic pageToken) async {
    isLoadingLoadmore.value = true;
    try {
      var getPlaylistItems =
          await kajianRepo.playlistItems(playlistId, pageToken: pageToken);
      if (!(getPlaylistItems is PlaylistItemsModel)) {
        if (getPlaylistItems.containsKey('error')) {
          playlistItemErr.value = getPlaylistItems;
        }
      } else {
        getPlaylistItems.items!.insertAll(0, playlistItemsData.value!.items!);
        playlistItemsData.value = getPlaylistItems;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    } finally {
      isLoadingLoadmore.value = false;
    }
  }
}
