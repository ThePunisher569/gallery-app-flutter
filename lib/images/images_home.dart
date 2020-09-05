import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_app/NavigationDrawer.dart';
import 'package:gallery_app/images/images_grid.dart';
import 'package:gallery_app/model/FileModel.dart';
import 'package:storage_path/storage_path.dart';
import 'dart:convert';
import 'dart:io';


class ImagesHome extends StatefulWidget {
  @override
  _ImagesHomeState createState() => _ImagesHomeState();
}

class _ImagesHomeState extends State<ImagesHome> {
  List<FileModel> images;

  @override
  initState() {
    super.initState();
    print('initState is called');
    getImagesPath();
    print('getImagesPath is called');
  }

  Future<List<FileModel>> getImagesPath() async {
    String _imagesPath = '';
    List<FileModel> list;
    SnackBar _snackBar;
    try{
      _imagesPath = await StoragePath.imagesPath;
      //images list with files and folder name

      var imagesList = jsonDecode(_imagesPath) as List;

      //root folderName handling********************
      Map<String,dynamic> rootObject = {'files':[],'folderName':'0'};
      for(Map<String,dynamic> a in imagesList){
        if (a['folderName']==null){
          a['folderName'] = '0';
          rootObject['files']=rootObject['files']+a['files'];
        }
      }
      imagesList.removeWhere((element) => element['folderName']=='0');
      imagesList.insert(0,rootObject);
      //***********************


      //integrating imagesList in FileModel
      list = imagesList.map<FileModel>((e) => FileModel.fromJson(e)).toList();
      setState(() {
        images = list;
      });
    } on PlatformException{
      _snackBar = SnackBar(content: Text("Failed to load images!"),
          duration: Duration(seconds: 3));
      Scaffold.of(context).showSnackBar(_snackBar);
    }
    return list;
  }
  @override
  Widget build(BuildContext context) {
    print('build is called');
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(title: Text('Images')),
      body: images==null?Center(child:CircularProgressIndicator()):RefreshIndicator(
          onRefresh: getImagesPath,
      child: ListView.builder(
          itemCount: images.length,
          itemExtent: 80,
          itemBuilder: (BuildContext context,int index){
            var _firstImage=images[index].files[0];
            return GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.black12,
                  child: Builder(
                    builder: (BuildContext context){
                      return ListTile(
                          title: Text(images[index].folder),
                          leading: Container(width: 60,height: 60,
                              child:_firstImage==null? Icon(Icons.person)
                                  : ClipOval(child: Image.file(
                                  File(_firstImage),fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high),
                              )
                          )
                      );
                    },
                  ),
                ),
              ),
              onTap: ()=>
                Navigator.push(context, MaterialPageRoute(builder: (context) => ImagesGrid()))
            );
          }
          )
      )
    );
  }
}