import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_app/model/FileModel.dart';
import 'package:transparent_image/transparent_image.dart';
// ignore: must_be_immutable
class ImagesGrid extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Images Grid'),),
      body: Center(child: Text('As memory management of flutter'
          'is shit, stopping the work here will continue in future if it gets better'),)
    );
  }
}

//TODO: GridView Causing a lot of load on app, load list<files> instead of list<strings>

