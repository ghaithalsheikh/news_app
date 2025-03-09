import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewShow extends StatefulWidget {
  const WebViewShow({super.key, required this.urlImage});
  final String urlImage;

  @override
  State<WebViewShow> createState() => _WebViewShowState();
}

class _WebViewShowState extends State<WebViewShow> {
  late InAppWebViewController webViewController;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: WebUri(widget.urlImage)),
                initialSettings: InAppWebViewSettings(
                  javaScriptEnabled: true,
                  transparentBackground: true,
                ),
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
                onLoadStart: (controller, url) {
                  setState(() => isLoading = true);
                },
                onLoadStop: (controller, url) {
                  setState(() => isLoading = false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
