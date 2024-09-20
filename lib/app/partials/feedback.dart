import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';

class FeedBack {
  Widget noData(
      {String icon = 'no_data.svg',
      String message = 'Tidak ada data ditemukan',
      dynamic paddingTop = null,
      bool scroll = true}) {
    final paddingTops = paddingTop ?? Get.size.height / 4;
    if (scroll) {
      return SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: paddingTops.toDouble()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: SvgPicture.asset(
                    'assets/icons/${icon}',
                    width: 150,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: Container(
          padding: EdgeInsets.only(top: paddingTops.toDouble()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: SvgPicture.asset(
                  'assets/icons/${icon}',
                  width: 150,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  message,
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      );
    }
  }

  Widget failedGetData(
      {String icon = 'failed_get_data.svg',
      String message = 'Tidak berhasil menampilkan data',
      VoidCallback? action = null,
      dynamic paddingTop = null,
      bool scroll = true}) {
    final paddingTops = paddingTop ?? Get.size.height / 4;

    if (scroll) {
      return SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: paddingTops.toDouble()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: SvgPicture.asset(
                    'assets/icons/${icon}',
                    width: 150,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                action != null
                    ? InkWell(
                        onTap: action,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: Color(ConfigColor.appBarColor1),
                          ),
                          child: Text(
                            'Refresh',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: Container(
          padding: EdgeInsets.only(top: paddingTops.toDouble()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: SvgPicture.asset(
                  'assets/icons/${icon}',
                  width: 150,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  message,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              action != null
                  ? InkWell(
                      onTap: action,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: Color(ConfigColor.appBarColor1),
                        ),
                        child: Text(
                          'Refresh',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      );
    }
  }
}
