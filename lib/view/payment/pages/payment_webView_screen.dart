// ignore_for_file: file_names

import 'dart:developer';

import 'package:crafty_bay/view_model/main/main_bottom_nav_view_model.dart';
import 'package:crafty_bay/view/main/pages/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  const PaymentWebView({super.key, required this.url});

  final String url;

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            log('url:$url');
            if (url.contains('PaymentSuccess')) {
              log('status:$url');
              Get.offAll(() => const MainBottomNavScreen());
              Get.find<MainBottomNavViewModel>().backToHome();
            } else if (url.contains('PaymentFail')) {
              log('status:$url');
              Get.offAll(() => const MainBottomNavScreen());
              Get.find<MainBottomNavViewModel>().backToHome();
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: WebViewWidget(
          controller: _webViewController,
        ));
  }

  AppBar get appBar {
    return AppBar(
      title: const Text('Payment'),
    );
  }
}
