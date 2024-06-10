import 'package:get/get.dart';
import 'package:mahaduna_apps/app/data/store_provider.dart';
import 'package:mahaduna_apps/app/models/store/all_produk_model.dart';

class StoreRepo extends GetxController {
  final StoreProvider _storeProvider = StoreProvider();

  void onInit() {
    super.onInit();
  }

  Map errorHandle(String message) {
    Map<String, dynamic> error = {'error': 'true', 'message': message};
    return error;
  }

  Future allProduk({int? page}) async {
    try {
      var response = await _storeProvider.allProduk(page: page);
      if (response.statusCode == 200) {
        return storeAllModelFromJson(response.bodyString!);
      } else {
        return errorHandle('tidak berhasil mengambil data');
      }
    } catch (err, trace) {
      print('all produk Error1 ${err}');
      print('all produk Error2 ${trace}');
      return errorHandle('tidak berhasil mengambil data');
    }
  }
}
