import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../widgets/appbar_widget.dart';

class WebViewPage extends StatelessWidget {
  final String url;

  const WebViewPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: basicAppBar(context: context, title: 'Web View'),
      body: WebViewWidget(controller: controller),
    );
  }
}
