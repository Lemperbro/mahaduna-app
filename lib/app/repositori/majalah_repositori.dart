import 'package:get/get.dart';
import 'package:mahaduna_apps/app/data/majalah_provider.dart';
import 'package:mahaduna_apps/app/models/majalah/majalah_all_model.dart';

class MajalahRepo extends GetxController with StateMixin {
  final MajalahProvider _majalahProvider = MajalahProvider();

  void onInit() {
    super.onInit();
  }

  Map errorHandle(String message) {
    Map<String, dynamic> error = {'error': 'true', 'message': message};
    return error;
  }

  Future allMajalah(
      {bool sortBest = false,
      dynamic keyword = null,
      String paginate = '6', int? page}) async {
    try {
      var value = await _majalahProvider.getAllMajalah(
          sortBest: sortBest, keyword: keyword, paginate: paginate, page: page);


      if (value.statusCode == 200) {
        var response = allMajalahModelFromJson(value.bodyString!);
        return response;
      } else {
        return errorHandle('tidak berhasil mengambil data');
      }
    } catch (err, trace) {
      print('all Majalah Error1 ${err}');
      print('all Majalah Error2 ${trace}');
      return errorHandle('tidak berhasil mengambil data');
    }
  }
}
