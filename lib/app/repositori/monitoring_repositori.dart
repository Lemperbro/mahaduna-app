import 'package:mahaduna_apps/app/data/monitoring_provider.dart';
import 'package:get/get.dart';
import 'package:mahaduna_apps/app/models/monitoring/hafalan_model.dart';
import 'package:mahaduna_apps/app/models/monitoring/monitoring_model.dart';

class MonitoringRepo extends GetxController with StateMixin {
  final MonitoringProvider _monitoringProvider = MonitoringProvider();

  void onInit() {
    super.onInit();
  }

  Map errorHandle(String message) {
    Map<String, dynamic> error = {'error': 'true', 'message': message};
    return error;
  }

  Future allMonitoring(String kategori, int santriId, String authKey,
      {int? paginate, int? page}) async {
    try {
      var value = await _monitoringProvider.allMonitoring(
          kategori, santriId, authKey,
          paginate: paginate, page: page);
      if (value.statusCode == 200) {
        var response = monitoringModelFromJson(value.bodyString!);
        return response;
      } else {
        return errorHandle('tidak berhasil mengambil data');
      }
    } catch (err, trace) {
      print('all Monitoring Error1 ${err}');
      print('all Monitoring Error2 ${trace}');
      return errorHandle('tidak berhasil mengambil data');
    }
  }

  Future allHafalan(int santriId, String authKey,
      {int? paginate, int? page}) async {
    try {
      var value = await _monitoringProvider.allHafalan(santriId, authKey,
          paginate: paginate, page: page);
      if (value.statusCode == 200) {
        var response = hafalanModelFromJson(value.bodyString!);
        return response;
      } else {
        return errorHandle('tidak berhasil mengambil data');
      }
    } catch (err, trace) {
      print('all hafalan Error1 ${err}');
      print('all hafalan Error2 ${trace}');
      return errorHandle('tidak berhasil mengambil data');
    }
  }
}
