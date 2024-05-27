import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaduna_apps/app/models/artikel/artikel_all_model.dart';
import 'package:mahaduna_apps/app/models/kajian/all_playlist_model.dart';
import 'package:mahaduna_apps/app/models/kajian/all_video_model.dart';
import 'package:mahaduna_apps/app/models/majalah/majalah_all_model.dart';
import 'package:mahaduna_apps/app/repositori/artikel_repositori.dart';
import 'package:mahaduna_apps/app/repositori/kajian_repositori.dart';
import 'package:mahaduna_apps/app/repositori/majalah_repositori.dart';

class HomeController extends GetxController with StateMixin {
  RxString activeMenuArtikel = 'terbaru'.obs;
  final kajianRepo = Get.put(KajianRepo());
  final majalahRepo = Get.put(MajalahRepo());
  final artikelRepo = Get.put(ArtikelRepo());

  final isLoadingAllPlaylist = true.obs;
  final allPlaylistData = Rx<AllPlaylist?>(null);
  final allPlaylistErr = Rx<Map<String, dynamic>?>(null);

  final isLoadingVideoTerbaru = true.obs;
  final videoTerbaruData = Rx<AllVideo?>(null);
  final videoTerbaruErr = Rx<Map<String, dynamic>?>(null);

  final isLoadingAddiyaPopular = true.obs;
  final addiyaPopularData = Rx<AllMajalahModel?>(null);
  final addiyaPopularErr = Rx<Map<String, dynamic>?>(null);

  final isLoadingAddiyaTerbaru = true.obs;
  final addiyaTerbaruData = Rx<AllMajalahModel?>(null);
  final addiyaTerbaruErr = Rx<Map<String, dynamic>?>(null);

  final isLoadingAllArtikelBest = true.obs;
  final allArtikelDataBest = Rx<AllArtikelModel?>(null);
  final allArtikelErrBest = Rx<Map<String, dynamic>?>(null);

  final isLoadingAllArtikelTerbaru = true.obs;
  final allArtikelDataTerbaru = Rx<AllArtikelModel?>(null);
  final allArtikelErrTerbaru = Rx<Map<String, dynamic>?>(null);

  final ScrollController scrollController = ScrollController();

  void onInit() {
    super.onInit();
  }

  void refreshPage() {
    scrollController.animateTo(0.0,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    allPlaylistVoid();
    videoTerbaruVoid();
    addiyaPopuler();
    addiyaTerbaru();
    allArtikel(sortBest: true);
    allArtikel();
  }

  Future refreshPageTop() async {
    allPlaylistVoid();
    videoTerbaruVoid();
    addiyaPopuler();
    addiyaTerbaru();
    allArtikel(sortBest: true);
    allArtikel();
  }

  @override
  void onReady() {
    super.onReady();
    allPlaylistVoid();
    videoTerbaruVoid();
    addiyaPopuler();
    addiyaTerbaru();
    allArtikel(sortBest: true);
    allArtikel();
  }

  void setActiveMenuArtikel(String menu) {
    activeMenuArtikel.value = menu;
  }

  void allPlaylistVoid() async {
    isLoadingAllPlaylist.value = true;
    try {
      var getAllPlaylist = await kajianRepo.getAllKajian();
      if (!(getAllPlaylist is AllPlaylist)) {
        if (getAllPlaylist.containsKey('error')) {
          this.allPlaylistErr.value = getAllPlaylist;
        }
      } else {
        this.allPlaylistData.value = getAllPlaylist;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    } finally {
      isLoadingAllPlaylist.value = false;
    }
  }

  void videoTerbaruVoid({dynamic pageToken = null}) async {
    isLoadingVideoTerbaru.value = true;
    try {
      var getVideoTerbaru = await kajianRepo.getAllLatestVideo(
          pageToken: pageToken, paginate: '4');
      if (!(getVideoTerbaru is AllVideo)) {
        if (getVideoTerbaru.containsKey('error')) {
          this.videoTerbaruErr.value = getVideoTerbaru;
        }
      } else {
        //ini cara menumpuk data
        // if (pageToken != null) {
        //   AllVideo? originalData = this.videoTerbaruData.value;
        //   if (originalData != null) {
        //     originalData.items.addAll(getVideoTerbaru.items);
        //     this.videoTerbaruData.value = originalData;
        //   }
        // } else {
        //   this.videoTerbaruData.value = getVideoTerbaru;
        // }

        this.videoTerbaruData.value = getVideoTerbaru;
      }
    } catch (err) {
      Get.snackbar('eror', 'Ada kesalahan sistem');
    } finally {
      isLoadingVideoTerbaru.value = false;
    }
  }

  void addiyaPopuler({String paginate = '10'}) async {
    isLoadingAddiyaPopular.value = true;
    try {
      var getAddiyaPopuler =
          await majalahRepo.allMajalah(sortBest: true, paginate: paginate);
      if (!(getAddiyaPopuler is AllMajalahModel)) {
        if (getAddiyaPopuler.containsKey('error')) {
          this.addiyaPopularErr.value = getAddiyaPopuler;
        }
      } else {
        this.addiyaPopularData.value = getAddiyaPopuler;
      }
    } catch (err) {
      Get.snackbar('eror', 'Ada kesalahan sistem');
    } finally {
      isLoadingAddiyaPopular.value = false;
    }
  }

  void addiyaTerbaru({String paginate = '6'}) async {
    isLoadingAddiyaTerbaru.value = true;
    try {
      var getAddiyaTerbaru =
          await majalahRepo.allMajalah(sortBest: false, paginate: paginate);
      if (!(getAddiyaTerbaru is AllMajalahModel)) {
        if (getAddiyaTerbaru.containsKey('error')) {
          this.addiyaTerbaruErr.value = getAddiyaTerbaru;
        }
      } else {
        this.addiyaTerbaruData.value = getAddiyaTerbaru;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    } finally {
      isLoadingAddiyaTerbaru.value = false;
    }
  }

  void findArtikelByKategori(int kategori_id) {
    allArtikel(kategori_id: kategori_id.toString());
  }

  void allArtikel(
      {String paginate = '5',
      dynamic keyword = null,
      bool? sortBest,
      String? kategori_id}) async {
    final isLoading = sortBest ?? false;
    if (isLoading) {
      isLoadingAllArtikelBest.value = true;
    } else {
      isLoadingAllArtikelTerbaru.value = true;
    }
    try {
      var getAllArtikel = await artikelRepo.allArtikel(
          paginate: paginate,
          keyword: keyword,
          sortBest: sortBest,
          kategori_id: kategori_id);
      if (!(getAllArtikel is AllArtikelModel)) {
        if (getAllArtikel.containsKey('error')) {
          if (sortBest != null && sortBest == true) {
            this.allArtikelErrBest.value = getAllArtikel;
          } else {
            this.allArtikelErrTerbaru.value = getAllArtikel;
          }
        }
      } else {
        if (sortBest == true) {
          this.allArtikelDataBest.value = getAllArtikel;
        } else {
          this.allArtikelDataTerbaru.value = getAllArtikel;
        }
      }
    } catch (err) {
      Get.snackbar('eror', 'Ada kesalahan sistem');
    } finally {
      if (isLoading) {
        isLoadingAllArtikelBest.value = false;
      } else {
        isLoadingAllArtikelTerbaru.value = false;
      }
    }
  }
}
