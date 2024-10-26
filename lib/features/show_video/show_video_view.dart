import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// ignore: library_prefixes
import 'package:http/http.dart' as httpServer;

class ShowVideoView extends StatefulWidget {
  const ShowVideoView({super.key});

  @override
  State<ShowVideoView> createState() => _ShowVideoViewState();
}

class _ShowVideoViewState extends State<ShowVideoView> {
  // data from server

  Future<String> loadHtmlFromWeb({required String username , required String password}) async {

  //const url = 'http://192.168.1.4:8000/settings/get_student_video/'; // localhost
  const url = 'https://staging.iceage.me.uk/settings/get_student_video/'; // staging server test
  final response = await httpServer.post(
  Uri.parse(url) , 
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },

    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

    final responseData = json.decode(response.body);
    print(responseData['video']['video_html'].toString());
    return responseData['video']['video_html'].toString();

  }

  // end data from server

    String ? htmlBunny; 

   WebViewController ? _controller;


/////////-------------///
Future<void> _initializeWebView() async {
  String htmlBunny = await loadHtmlFromWeb(username: 'ahmedissa' , password:'withALLAH' );
  print("ssssssssssssssssssssssssssssss");
  print(htmlBunny);
  print("ssssssssssssssssssssssssssssss");
  setState(() {
     _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..loadHtmlString(htmlBunny);
  });
   
}
/////////


  @override
  void initState()  {
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
        child: _controller == null ? const CircularProgressIndicator() : WebViewWidget(
          controller: _controller!,
        ),
      ),
    );
  }
}
