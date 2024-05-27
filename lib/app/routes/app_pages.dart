import 'package:get/get.dart';

import '../middleware/wali_auth_middleware.dart';
import '../modules/addiya/bindings/addiya_binding.dart';
import '../modules/addiya/views/addiya_view.dart';
import '../modules/addiya/views/pdf_viewer_view.dart';
import '../modules/artikel/bindings/artikel_read_binding.dart';
import '../modules/artikel/views/artikel_read_view.dart';
import '../modules/artikel/views/artikel_view.dart';
import '../modules/bottom_navigate/bindings/bottom_navigate_binding.dart';
import '../modules/bottom_navigate/views/bottom_navigate_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jadwal/bindings/jadwal_binding.dart';
import '../modules/jadwal/views/jadwal_view.dart';
import '../modules/kajian/bindings/kajian_binding.dart';
import '../modules/kajian/views/kajian_view.dart';
import '../modules/play_kajian/bindings/play_kajian_binding.dart';
import '../modules/play_kajian/views/play_kajian_view.dart';
import '../modules/playlist_items/bindings/playlist_items_binding.dart';
import '../modules/playlist_items/views/playlist_items_view.dart';
import '../modules/pondok/bindings/pondok_binding.dart';
import '../modules/pondok/views/pondok_view.dart';
import '../modules/santri/bindings/santri_binding.dart';
import '../modules/santri/views/santri_view.dart';
import '../modules/store/bindings/store_binding.dart';
import '../modules/store/views/produk_detail_view.dart';
import '../modules/store/views/store_view.dart';
import '../modules/transaksi/bindings/transaksi_binding.dart';
import '../modules/transaksi/views/payment_view.dart';
import '../modules/transaksi/views/transaksi_view.dart';
import '../modules/wali/bindings/wali_binding.dart';
import '../modules/wali/views/login_view.dart';
import '../modules/wali/views/wali_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_NAVIGATE;

  static final routes = [
    GetPage(
        name: _Paths.BOTTOM_NAVIGATE,
        page: () => BottomNavigateView(),
        binding: BottomNavigateBinding(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 1)),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.KAJIAN,
      page: () => KajianView(),
      binding: KajianBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.WALI,
      page: () => WaliView(),
      binding: WaliBinding(),
      middlewares: [WaliAuthMiddleware()],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.PONDOK,
      page: () => PondokView(),
      binding: PondokBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.PLAY_KAJIAN,
      page: () => PlayKajianView(),
      binding: PlayKajianBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.PLAYLIST_ITEMS,
      page: () => PlaylistItemsView(),
      binding: PlaylistItemsBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.ADDIYA,
      page: () => const AddiyaView(),
      binding: AddiyaBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.PDF_VIEWER,
      page: () => PdfViewerView(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.ARTIKEL,
      page: () => ArtikelView(),
      binding: ArtikelReadBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.ARTIKEL_READ,
      page: () => ArtikelReadView(),
      binding: ArtikelReadBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.STORE,
      page: () => StoreView(),
      binding: StoreBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.PRODUK_DETAIL,
      page: () => ProdukDetailView(),
      binding: StoreBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.JADWAL,
      page: () => const JadwalView(),
      binding: JadwalBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: WaliBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.TRANSAKSI,
      page: () => TransaksiView(),
      binding: TransaksiBinding(),
      middlewares: [WaliAuthMiddleware()],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: TransaksiBinding(),
      middlewares: [WaliAuthMiddleware()],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 1),
    ),
    GetPage(
      name: _Paths.SANTRI,
      page: () => const SantriView(),
      binding: SantriBinding(),
    ),
  ];
}
