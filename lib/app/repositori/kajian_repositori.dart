import 'dart:async';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/data/kajian_provider.dart';
import 'package:mahaduna_apps/app/models/kajian/all_playlist_model.dart';
import 'package:mahaduna_apps/app/models/kajian/all_video_model.dart';
import 'package:mahaduna_apps/app/models/kajian/find_video_model.dart';
import 'package:mahaduna_apps/app/models/kajian/playlist_items_models.dart';

class KajianRepo extends GetxController with StateMixin {
  final KajianProvider _kajianProvider = KajianProvider();

  void onInit() {
    super.onInit();
  }

  Map errorHandle(String message) {
    Map<String, dynamic> error = {'error': 'true', 'message': message};
    return error;
  }

  //ini pakai model AllPlaylist
  Future getAllKajian({String paginate = '10', int page = 1}) async {
    try {
      var value =
          await _kajianProvider.getAllKajian(paginate: paginate, page: page);
      if (value.statusCode == 200) {
        var response = allPlaylistFromJson(value.bodyString!);
        return response;
      } else {
        return errorHandle('tidak berhasil mengambil data');
      }
    } catch (err, trace) {
      print('all Kajian Error1 ${err}');
      print('all Kajian Error2 ${trace}');
      return errorHandle('tidak berhasil mengambil data');
    }
  }

  Future getAllLatestVideo(
      {evenType = 'completed',
      pageToken = null,
      String paginate = '10',
      String? keyword}) async {
    try {
      var value = await _kajianProvider.getAllLatestVideo(
          evenType: evenType,
          pageToken: pageToken,
          paginate: paginate,
          keyword: keyword);
      if (value.statusCode == 200) {
        var response = allVideoFromJson(value.bodyString!);
        return response;
      } else {
        return errorHandle('tidak berhasil mengambil data');
      }
    } catch (err, trace) {
      print('latest video Error1 ${err}');
      print('latest video Error2 ${trace}');
      return errorHandle('tidak berhasil mengambil data');
    }
  }

  Future findDetailVideo(String videoId) async {
    try {
      var value = await _kajianProvider.findVideo(videoId);

      if (value.statusCode == 200) {
        var response = findVideoModelFromJson(value.bodyString!);
        return response;
      } else {
        return errorHandle('tidak berhasil mengambil data');
      }
    } catch (err) {
      return errorHandle('tidak berhasil mengambil data');
    }
  }

  Future playlistItems(String playlistId, {dynamic pageToken = null}) async {
    try {
      var value =
          await _kajianProvider.playlistItems(playlistId, pageToken: pageToken);
      if (value.statusCode == 200) {
        var response = playlistItemsModelFromJson(value.bodyString!);
        return response;
      } else {
        return errorHandle('tidak berhasil mengambil data');
      }
    } catch (err, trace) {
      print('playlist items Error1 ${err}');
      print('playlist items Error2 ${trace}');
      return errorHandle('tidak berhasil mengambil data');
    }
  }
}
