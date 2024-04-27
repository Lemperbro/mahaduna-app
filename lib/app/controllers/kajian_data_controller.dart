import 'package:get/get.dart';
import 'package:mahaduna_apps/app/data/kajian_provider.dart';
import 'package:mahaduna_apps/app/modules/kajian/models/all_playlist.dart';
// import 'package:mahaduna_apps/app/modules/kajian/models/all_video.dart';

class KajianDataController extends GetxController with StateMixin<AllPlaylist> {
  final KajianProvider _kajianProvider = KajianProvider();

  //ini pakai model AllPlaylist
  void getAllKajian() {
    try {
      _kajianProvider.getAllKajian().then((value) {
        if (value.statusCode == 200) {
          var response = allPlaylistFromJson(value.bodyString ?? '');
          change(response, status: RxStatus.success());
        }
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error());
      });
    } catch (err) {}
  }

  //ini pakai model AllVideo
  // void getAllLatestVideo(){
  //   try{
  //     _kajianProvider.getAllLatestVideo().then((value){
  //       var response = allVideoFromJson(value.bodyString ?? '');
  //       change(response, status: RxStatus.success());
  //     });
  //   }catch(err){}
  // }
}

// class AllVideo extends GetxController with StateMixin<AllVideo> {
//   final KajianProvider provider = KajianProvider();
//   void getAllLatestVideo() {
//     try {
//       provider.getAllLatestVideo().then((value) {
//         print(value.body);
//         if (value.statusCode == 200) {
//           var response = allVideoFromJson(value.bodyString ?? '');
//           change(response as AllVideo, status: RxStatus.success());
//         }
//       }).onError((error, stackTrace) {
//         print('error ${error}');
//         change(null, status: RxStatus.error());
//       });
//       ;
//     } catch (err) {}
//   }
// }
