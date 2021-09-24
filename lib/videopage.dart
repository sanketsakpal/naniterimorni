import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_naniterimorani/common.dart';
import 'package:flutter_application_naniterimorani/model/videosapi.dart';
import 'package:flutter_application_naniterimorani/webviewexampl.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({
    Key? key,
  }) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage>
    with SingleTickerProviderStateMixin {
  List arre = [];
  List<VideoExample>? kkr = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 1,
                maxCrossAxisExtent: 300,
                mainAxisSpacing: 20),
            itemCount: kkr?.length,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  print("hello");
                  // launch("${kkr?[index].url}");
                  common.url = "${kkr?[index].url}";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => Webviewexample(
                                videos: kkr?[index],
                                vv: kkr,
                              )));
                },
                child: Card(
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("${kkr?[index].image}"),
                            fit: BoxFit.fill)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      // child: WebView(
                      //   initialUrl:
                      //       "https://www.youtube.com/watch?v=SQf1052nI0U",
                      // ),
                    ),
                  ),
                ),
              );
            }));
  }

  callapi() async {
    var resp = await http.get(
        Uri.parse("http://mapi.trycatchtech.com/v1/kids_stories/videos_list"));
    arre = jsonDecode(resp.body);
    setState(() {
      for (var item in arre) {
        kkr?.add(VideoExample.fromJson(item));
      }
      // print(kkr?[0].title);
    });
  }
}
