import 'package:flutter/material.dart';
import 'package:fluttercareerui/constants/app_constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDisplay extends StatefulWidget {
  const WebViewDisplay({super.key, this.url});

  final String? url;

  @override
  State<WebViewDisplay> createState() => _WebViewDisplayState();
}

class _WebViewDisplayState extends State<WebViewDisplay> {
  late final WebViewController _controller;
  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(AppConstants.youtubePath)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url ?? AppConstants.roadmapPath));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WebViewWidget(controller: _controller));
  }
}
