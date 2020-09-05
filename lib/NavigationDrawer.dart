import 'package:flutter/material.dart';
import 'package:gallery_app/videos/videos_home.dart';

import 'images/images_home.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(padding: EdgeInsets.all(12.0)),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Images'),
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ImagesHome()));
              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.video_library),
            title: Text('Videos'),
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> VideosHome()));
              //Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
