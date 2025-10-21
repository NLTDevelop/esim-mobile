
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/core/constants/variables.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FaqPage extends StatelessWidget {
  FaqPage({super.key});

  late final WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(kFaqUrl));

    return DefaultScaffold(
      appBar: AppBar(
        title: const DefaultText.bodySmall('FAQ'),
        leading: GestureDetector(
          onTap: (){
            context.pop();
          },
          child: Icon(Icons.arrow_back_ios, color: Theme.of(context).extension<ColorExtension>()!.text),
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
