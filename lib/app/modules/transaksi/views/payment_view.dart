import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahaduna_apps/app/config/config.dart';
import 'package:mahaduna_apps/app/modules/transaksi/controllers/payment_controller.dart';
import 'package:mahaduna_apps/app/routes/app_pages.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentView extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    final WebViewController webViewC = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          controller.isLoading.value = true;
          if (progress == 100) {
            controller.isLoading.value = false;
          }
        },
        onWebResourceError: (WebResourceError error) {
          print(error);
        },
      ))
      ..loadRequest(Uri.parse(controller.arguments));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bayar Syariah'),
        backgroundColor: Color(ConfigColor.appBarColor1),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : PopScope(
                canPop: false,
                onPopInvoked: ((didPop) {
                  if (didPop) {
                    return;
                  }
                  Get.back();
                }),
                child: WebViewWidget(
                  controller: webViewC,
                ),
              ),
      ),
    );
  }
}
