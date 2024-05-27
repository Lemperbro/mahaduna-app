import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaduna_apps/app/models/kajian/all_playlist_model.dart';
import 'package:mahaduna_apps/app/models/kajian/all_video_model.dart';
import 'package:mahaduna_apps/app/repositori/kajian_repositori.dart';

class KajianController extends GetxController with StateMixin {
  final kajianRepo = Get.put(KajianRepo());

  final isLoadingAllVideo = false.obs;
  final isLoadingMoreVideo = false.obs;
  final isLoadingMorePlaylist = false.obs;
  final limitLoadMore = 10.obs;
  final allVideoData = Rx<AllVideo?>(null);
  final allVideoErr = Rx<Map<String, dynamic>?>(null);

  final isLoadingPlaylist = true.obs;
  final playlistData = Rx<AllPlaylist?>(null);
  final playlistErr = Rx<Map<String, dynamic>?>(null);

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    allVideoVoid();
    allPlaylist();
  }

  void refreshPage() {
    scrollController.animateTo(0.0,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    allVideoVoid();
    allPlaylist();
  }

  void allPlaylist({dynamic pageToken = null}) async {
    isLoadingPlaylist.value = true;
    try {
      var getPlaylist = await kajianRepo.getAllKajian(paginate: '4');
      if (!(getPlaylist is AllPlaylist)) {
        if (getPlaylist.containsKey('error')) {
          this.playlistErr.value = getPlaylist;
        }
      } else {
        playlistData.value = getPlaylist;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    } finally {
      isLoadingPlaylist.value = false;
    }
  }

  void loadMorePlaylist(int page) async {
    isLoadingMorePlaylist.value = true;
    try {
      var getPlaylist =
          await kajianRepo.getAllKajian(paginate: '4', page: page);
      if (!(getPlaylist is AllPlaylist)) {
        if (getPlaylist.containsKey('error')) {
          this.playlistErr.value = getPlaylist;
        }
      } else {
        getPlaylist.data!.insertAll(0, playlistData.value!.data!);
        playlistData.value = getPlaylist;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    } finally {
      isLoadingMorePlaylist.value = false;
    }
  }

  void loadMoreAllVideo(dynamic pageToken) async {
    isLoadingMoreVideo.value = true;
    limitLoadMore.value--;
    try {
      var getAllVideo = await kajianRepo.getAllLatestVideo(
          paginate: '10', pageToken: pageToken);
      if (!(getAllVideo is AllVideo)) {
        if (getAllVideo.containsKey('error')) {
          this.allVideoErr.value = getAllVideo;
        }
      } else {
        // Ini cara menumpuk data
        getAllVideo.items!.insertAll(0, allVideoData.value!.items!);
        allVideoData.value = getAllVideo;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    } finally {
      isLoadingMoreVideo.value = false;
    }
  }

  Future refreshAllVideo() async {
    allVideoVoid();
  }

  Future refreshPlaylist() async {
    allPlaylist();
  }

  void allVideoVoid({dynamic pageToken = null}) async {
    isLoadingAllVideo.value = true;
    limitLoadMore.value = 10;
    try {
      var getAllVideo = await kajianRepo.getAllLatestVideo(
          paginate: '10', pageToken: pageToken);
      if (!(getAllVideo is AllVideo)) {
        if (getAllVideo.containsKey('error')) {
          this.allVideoErr.value = getAllVideo;
        }
      } else {
        allVideoData.value = getAllVideo;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    } finally {
      isLoadingAllVideo.value = false;
    }
  }
}
