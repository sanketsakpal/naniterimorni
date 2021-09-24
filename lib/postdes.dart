import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_naniterimorani/common.dart';
import 'package:flutter_application_naniterimorani/model/imageapi.dart';

class Postdec extends StatefulWidget {
  const Postdec({Key? key}) : super(key: key);

  @override
  _PostdecState createState() => _PostdecState();
}

class _PostdecState extends State<Postdec> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
                "https://lh3.googleusercontent.com/MV3QtRgVqWZoin6EQ0XqgJ0U_OugwQL8wsUXRQ234mTgoJhs1AxdsqHabg9PNkUiig"),
            SizedBox(
              height: 15,
            ),
            Text(
              "${common.title}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text("${common.post_desc}"),
            ),
          ],
        ),
      )),
    );
  }
}
