

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ShowVideoView extends StatefulWidget {
  const ShowVideoView({super.key});

  @override
  State<ShowVideoView> createState() => _ShowVideoViewState();
}

class _ShowVideoViewState extends State<ShowVideoView> {
  // data from server

  Future<String> loadHtmlFromWeb(
      {required String username, required String password}) async {
    //const url = 'http://192.168.1.4:8000/settings/get_student_video/'; // localhost
    const url =
        'https://staging.iceage.me.uk/settings/get_student_video/'; // staging server test

    final resposeDio = await Dio().post(url,
        data: {
          'username': username,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ));
    return resposeDio.data['video']['video_html'].toString();

  }

  // end data from server

  String? htmlBunny;

  WebViewController? _controller;

/////////-------------///
  Future<void> _initializeWebView() async {
    String htmlBunny =
        await loadHtmlFromWeb(username: 'ahmedissa', password: 'withALLAH');
    // print("ssssssssssssssssssssssssssssss");
    // print(htmlBunny);
    // print("ssssssssssssssssssssssssssssss");
    setState(() {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(Colors.white)
        ..loadHtmlString(htmlBunny);
    });
  }
/////////

  @override
  void initState() {
    super.initState();
    //_controller = WebViewController();

    setState(() {
      _initializeWebView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
      ),
      //  webview_flutter
      body: Center(
        child: _controller == null
            ? const CircularProgressIndicator()
            : WebViewWidget(
                controller: _controller!,
              ),
      ),
    );
  }
}
