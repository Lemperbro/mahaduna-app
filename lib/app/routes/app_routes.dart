part of 'app_pages.dart';
abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const KAJIAN = _Paths.KAJIAN;
  static const WALI = _Paths.WALI;
  static const PONDOK = _Paths.PONDOK;
  static const BOTTOM_NAVIGATE = _Paths.BOTTOM_NAVIGATE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const KAJIAN = '/kajian';
  static const WALI = '/wali';
  static const PONDOK = '/pondok';
  static const BOTTOM_NAVIGATE = '/bottom-navigate';
}
