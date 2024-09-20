import 'package:get/get.dart';
import 'package:mahaduna_apps/app/data/jadwal_provider.dart';
import 'package:mahaduna_apps/app/models/jadwal/jadwal_model.dart';

class JadwalRepo extends GetxController {
  final jadwalProvider = JadwalProvider();

  void onInit() {
    super.onInit();
  }

  Map errorHandle(String message) {
    Map<String, dynamic> error = {'error': 'true', 'message': message};
    return error;
  }

  Future allJadwal() async {
    try {
      var getJadwal = await jadwalProvider.allJadwal();
      if (getJadwal.statusCode == 200) {
        var response = jadwalModelFromJson(getJadwal.bodyString!);
        return response;
      } else {
        return errorHandle('tidak berhasil mengambil data');
      }
    } catch (err, trace) {
      print('all jadwal Error1 ${err}');
      print('all jadwal Error2 ${trace}');
      return errorHandle('tidak berhasil mengambil data');
    }
  }
}
