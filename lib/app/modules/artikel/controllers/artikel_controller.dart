import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mahaduna_apps/app/models/artikel/all_kategori_artikel_model.dart';
import 'package:mahaduna_apps/app/models/artikel/artikel_all_model.dart';
import 'package:mahaduna_apps/app/repositori/artikel_repositori.dart';

class ArtikelController extends GetxController {
  RxString activeMenuArtikel = 'semua'.obs;
  final RxInt kategoriIdAktif = 0.obs;
  final artikelRepo = Get.put(ArtikelRepo());
  GetStorage getStorage = GetStorage('artikel');

  final isLoadingAllArtikelTerbaru = true.obs;
  final isLoadingLoadMore = false.obs;
  final allArtikelDataTerbaru = Rx<AllArtikelModel?>(null);
  final allArtikelErrTerbaru = Rx<Map<String, dynamic>?>(null);

  final allKategori = Rx<AllKategoriArtikelModel?>(null);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    allArtikel();
    allKategoriVoid();
  }

  @override
  void onClose() {
    getStorage.erase();
    super.onClose();
  }

  Future refreshPage() async {
    if (this.kategoriIdAktif.value != 0) {
      getStorage.erase();
      allArtikel(kategori_id: this.kategoriIdAktif.toString());
    } else {
      allArtikel();
    }
  }

  void setActiveMenuArtikel(String menu, kategori_id) {
    if (menu == 'semua' && kategori_id == null) {
      kategoriIdAktif.value = 0;
      allArtikel();
    } else {
      kategoriIdAktif.value = kategori_id;
      allArtikel(kategori_id: kategori_id.toString());
    }
    activeMenuArtikel.value = menu;
  }

  void allKategoriVoid() async {
    try {
      var getKategori = await artikelRepo.allArtikelKategori();
      if (!(getKategori is AllKategoriArtikelModel)) {
        if (getKategori.containsKey('error')) {
          allArtikelErrTerbaru.value = getKategori;
        }
      } else {
        allKategori.value = getKategori;
      }
    } catch (err) {
      Get.snackbar('eror', 'Ada kesalahan sistem');
    }
  }

  void allArtikel(
      {String paginate = '8',
      dynamic keyword = null,
      bool? sortBest,
      String? kategori_id}) async {
    isLoadingAllArtikelTerbaru.value = true;
    try {
      var datas = getStorage.read('artikel_${kategori_id}');
      if (kategori_id != null && datas != null) {
        var data;
        if (datas is AllArtikelModel) {
          data = datas;
        } else {
          data = allArtikelModelFromJson(jsonEncode(datas));
        }
        this.allArtikelDataTerbaru.value = data;
      } else {
        var getAllArtikel = await artikelRepo.allArtikel(
            paginate: paginate,
            keyword: keyword,
            sortBest: sortBest,
            kategori_id: kategori_id);
        if (!(getAllArtikel is AllArtikelModel)) {
          if (getAllArtikel.containsKey('error')) {
            this.allArtikelErrTerbaru.value = getAllArtikel;
          }
        } else {
          if (kategori_id == null) {
            getStorage.write('artikel_semua', getAllArtikel);
          } else {
            getStorage.write('artikel_${kategori_id}', getAllArtikel);
          }
          this.allArtikelDataTerbaru.value = getAllArtikel;
        }
      }
    } catch (err, trace) {
      print('error 1 ${err}');
      print('error 2 ${trace}');
      Get.snackbar('eror', 'Ada kesalahan sistem');
    } finally {
      isLoadingAllArtikelTerbaru.value = false;
    }
  }

  void loadMoreArtikel(int page,
      {String paginate = '8',
      dynamic keyword = null,
      bool? sortBest,
      String? kategori_id}) async {
    isLoadingLoadMore.value = true;
    try {
      var datas = getStorage.read('artikel_${kategori_id}');
      AllArtikelModel? existingData;
      if (kategori_id != null && datas != null) {
        if (datas is AllArtikelModel) {
          existingData = datas;
        } else {
          existingData = allArtikelModelFromJson(jsonEncode(datas));
        }
      }

      var getAllArtikel = await artikelRepo.allArtikel(
          paginate: paginate,
          keyword: keyword,
          sortBest: sortBest,
          kategori_id: kategori_id,
          page: page);

      if (!(getAllArtikel is AllArtikelModel)) {
        if (getAllArtikel.containsKey('error')) {
          this.allArtikelErrTerbaru.value = getAllArtikel;
        }
      } else {
        getAllArtikel.data!.insertAll(0, allArtikelDataTerbaru.value!.data!);

        if (kategori_id == null) {
          getStorage.write('artikel_semua', getAllArtikel);
        } else {
          getStorage.write('artikel_${kategori_id}', getAllArtikel);
        }
        this.allArtikelDataTerbaru.value = getAllArtikel;
      }
    } catch (err, trace) {
      print('error 1 ${err}');
      print('error 2 ${trace}');
      Get.snackbar('eror', 'Ada kesalahan sistem');
    } finally {
      isLoadingLoadMore.value = false;
    }
  }
}
