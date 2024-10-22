import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowVideoView extends StatefulWidget {
  const ShowVideoView({super.key});

  @override
  State<ShowVideoView> createState() => _ShowVideoViewState();
}

class _ShowVideoViewState extends State<ShowVideoView> {
  static String htmlBunny =
      '<div style="position:relative;padding-top:56.25%;"><iframe src="https://iframe.mediadelivery.net/embed/328363/dd0020d1-53af-4820-be5a-78a9b7f98fdc?autoplay=false&loop=false&muted=false&preload=false&responsive=true" loading="lazy" style="border:0;position:absolute;top:100%;height:100%;width:100%;" allow="accelerometer;gyroscope;autoplay;encrypted-media;picture-in-picture;" allowfullscreen="true"></iframe></div>';

  late WebViewController _controller;
  @override
  void initState() {
    super.initState();
  
    _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)..setBackgroundColor(Colors.white)
    ..loadHtmlString(htmlBunny);
    
  }



  // controller to run  view
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // webview_flutter
      body: WebViewWidget(

        controller: _controller,
      ),
    );
  }
}
