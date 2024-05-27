import 'package:get/get.dart';

import '../controllers/playlist_items_controller.dart';

class PlaylistItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaylistItemsController>(
      () => PlaylistItemsController(),
    );
  }
}
