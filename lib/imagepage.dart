import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_naniterimorani/common.dart';
import 'package:flutter_application_naniterimorani/postdes.dart';
import 'package:http/http.dart' as http;

import 'model/imageapi.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  List arre = [];
  List<Example>? kkr = [];
  @override
  void initState() {
    super.initState();
    callapi();
  }

  callapi() async {
    var resp = await http.get(Uri.parse(
        "http://mapi.trycatchtech.com/v1/kids_stories/kids_stories_list"));
    arre = jsonDecode(resp.body);
    // print(arre);
    setState(() {
      for (var item in arre) {
        kkr?.add(Example.fromJson(item));
        print(kkr?[0].postTitle);
      }
      print(kkr?[0].postImage?.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: kkr?.length,
            itemBuilder: (ctx, index) {
              return Card(
                child: GestureDetector(
                  onTap: () {
                    common.post_desc = "${kkr?[index].postDesc}";
                    common.title = "${kkr?[index].postTitle}";
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => Postdec()));
                  },
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://i.pinimg.com/originals/6b/f1/d6/6bf1d682fd2b21e351858cc66c5e48e9.jpg"))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("${kkr?[index].postTitle}",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                ),
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
              );
            }));
  }
}
