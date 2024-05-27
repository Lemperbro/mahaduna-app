import 'dart:async';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/data/tagihan_provider.dart';
import 'package:mahaduna_apps/app/models/tagihan/create_tagihan_models.dart';
import 'package:mahaduna_apps/app/models/tagihan/tagihan_from_santri_model.dart';

class TagihanRepo extends GetxController {
  final TagihanProvider tagihanProvider = TagihanProvider();
  void onInit() {
    super.onInit();
  }

  Map errorHandle(String message) {
    Map<String, dynamic> error = {'error': 'true', 'message': message};
    return error;
  }

  Future allTagihanTagihanFromSantri(String authKey,
      {String status = 'belum dibayar',
      String payment_status = 'PENDING'}) async {
    try {
      var get = await tagihanProvider.allTagihanTagihanFromSantri(authKey,
          status: status, payment_status: payment_status);
      if (get.statusCode == 200) {
        var response = allTagihanSantriModelFromJson(get.bodyString!);
        return response;
      } else {
        return errorHandle('tidak berhasil mengambil data');
      }
    } catch (err, trace) {
      print('all tagihan Error1 ${err}');
      print('all tagihan Error2 ${trace}');
      return errorHandle('tidak berhasil mengambil data');
    }
  }

  Future createPayment(String authKey, int tagihan_id) async {
    try {
      var post = await tagihanProvider.createPayment(authKey, tagihan_id);
      if (post.statusCode == 201) {
        var response = createPaymentModelsFromJson(post.bodyString!);
        return response;
      } else {
        return errorHandle('tidak berhasil mengambil data');
      }
    } catch (err, trace) {
      print('create payment Error1 ${err}');
      print('create payment Error2 ${trace}');
      return errorHandle('tidak berhasil mengambil data');
    }
  }
}
