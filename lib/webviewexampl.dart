import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_naniterimorani/common.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'model/videosapi.dart';

class Webviewexample extends StatefulWidget {
  final VideoExample? videos;
  final List<VideoExample>? vv;
  const Webviewexample({Key? key, required this.videos, required this.vv})
      : super(key: key);

  @override
  _WebviewexampleState createState() => _WebviewexampleState();
}

class _WebviewexampleState extends State<Webviewexample> {
  List<VideoExample>? kkr;
  // https://www.youtube.com/watch?v=

  // String tt = "https://www.youtube.com/watch?v=${common.url}";
  @override

  // String tt = "https://www.youtube.com/watch?v=${common.url}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: WebView(
          //   initialUrl: setState(() {
          //     tt;
          // }),

          initialUrl: "https://www.youtube.com/watch?v=${widget.videos!.url}",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
  // https://www.youtube.com/watch?v=
}
