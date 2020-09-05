import 'package:flutter/material.dart';
import 'package:gallery_app/NavigationDrawer.dart';

class VideosHome extends StatefulWidget {
  @override
  _VideosHomeState createState() => _VideosHomeState();
}

class _VideosHomeState extends State<VideosHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Videos'),
      ),
    );
  }
}
