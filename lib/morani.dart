import 'package:flutter/material.dart';
import 'package:flutter_application_naniterimorani/imagepage.dart';
import 'package:flutter_application_naniterimorani/videopage.dart';

class Morani extends StatefulWidget {
  const Morani({Key? key}) : super(key: key);

  @override
  _MoraniState createState() => _MoraniState();
}

class _MoraniState extends State<Morani> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Tab> toptabs = [
    Tab(
      text: "Stories",
    ),
    Tab(
      text: "Videos",
    )
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NaniteriMorani"),
        bottom: TabBar(
          controller: _tabController,
          tabs: toptabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [ImagePage(), VideoPage()],
      ),
    );
  }
}
