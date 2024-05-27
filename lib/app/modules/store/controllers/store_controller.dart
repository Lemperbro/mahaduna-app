// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mahaduna_apps/app/models/store/all_produk_model.dart';
import 'package:mahaduna_apps/app/repositori/store_repository.dart';

class StoreController extends GetxController {
  final storeRepo = Get.put(StoreRepo());

  late final String baseUrlBackend;

  final isLoadingAllProduk = true.obs;
  final allProdukData = Rx<StoreAllModel?>(null);
  final allProdukErr = Rx<Map<String, dynamic>?>(null);
  @override
  void onInit() {
    baseUrlBackend = BaseUrlBackend.baseUrl;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    allProduk();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future refreshPage() async {
    allProduk();
  }

  void allProduk() async {
    isLoadingAllProduk.value = true;
    try {
      var getAllProduk = await storeRepo.allProduk();
      if (!(getAllProduk is StoreAllModel)) {
        if (getAllProduk.containsKey('error')) {
          this.allProdukErr.value = getAllProduk;
        }
      } else {
        this.allProdukData.value = getAllProduk;
      }
    } catch (err) {
      Get.snackbar('error', 'Ada kesalahan sistem');
    } finally {
      isLoadingAllProduk.value = false;
    }
  }

  void redirectToWa(String productName) async {
    http.Response getTelpAdmin =
        await http.get(Uri.parse('${baseUrlBackend}/admin/number'));
    if (getTelpAdmin.statusCode == 200) {
      Map<String, dynamic> data = json.decode(getTelpAdmin.body);
      String a = data['number'];
      String noTelp = '62' + a.substring(1);
      String message =
          'Halo, saya ingin memesan produk ini, \nBisakah Anda membantu saya dengan proses pemesanan? \n*Nama Produk: $productName.* ';
      String url = "whatsapp://send?phone=${noTelp}" +
          "&text=${Uri.encodeComponent(message)}";
      try {
        launchUrl(Uri.parse(url));
      } catch (err) {
        Get.snackbar(
          'Error',
          'Tidak dapat membuka WhatsApp. Pastikan aplikasi WhatsApp terpasang.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Sistem sedang sibuk',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
