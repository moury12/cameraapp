import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? thumbnailImageLocalPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    _getImage(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text('Open Camera'),
                ),
                TextButton.icon(
                  onPressed: () {
                    _getImage(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.photo_album),
                  label: const Text('Open Gallery'),
                ),
              ],
            ),
          ),thumbnailImageLocalPath!=null?
          Image.file(File(thumbnailImageLocalPath!),height: 300,width: double.infinity,fit: BoxFit.cover,):Text(''),
          thumbnailImageLocalPath!=null? ElevatedButton(onPressed: (){save();}, child: Text('save')):Text('')
        ],
      ),
    );
  }

  void _getImage(ImageSource imageSource) async{
    final pickedImage = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: 70,
    );
    if (pickedImage != null) {
      setState(() {
        thumbnailImageLocalPath = pickedImage.path;
      });
    }
  }

  void save() async{
    if (thumbnailImageLocalPath == null) {
      showMsg(context, 'Please select a image');
      return;
    }
    else{
      String? downloadurl;
    try{

    }catch(e){

    }
    }
  }
}showMsg(BuildContext context, String msg){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
