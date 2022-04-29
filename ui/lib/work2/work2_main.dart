import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:ui';

import 'package:image_picker/image_picker.dart';
import 'package:stamp_image/stamp_image.dart';
import 'package:video_player/video_player.dart';
import 'package:ui/work2/watermark_stamp/example.dart';
import 'package:ui/work2/watermark_stamp/home.dart';
import 'package:ui/work2/watermark_stamp/videoPlayer.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stamp Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          //  SamplePlayer(),
          //player(),
          MyHomePage(),
      //home(),
      //toolBar(),
      //HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final picker = ImagePicker();
  File? image;
  var imgBytes2;
  var _image1;
  String imgname = "image not selected";
  // File? image2;

  void takePicture() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      await resetImage();

      StampImage.create(
        context: context,
        image: File(pickedFile.path),
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: _watermarkItem(),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: _logoFlutter(),
          )
        ],
        onSuccess: (file) => resultStamp(file),
      );
    }
  }

  ///Resetting an image file
  Future resetImage() async {
    setState(() {
      image = null;
    });
  }

  ///Handler when stamp image complete
  void resultStamp(File? file) {
    print(file?.path);
    setState(() {
      image = file;
    });
  }

  Widget _watermarkItem() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            DateTime.now().toString(),
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(height: 5),
          Text(
            "Made By Stamp Image",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoFlutter() {
    return Opacity(
      opacity: 0.4,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            backgroundBlendMode: BlendMode.srcOver),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child:
              // Image.memory(imgBytes2, height: 20, width: 20, color: Color.fromRGBO(255, 255, 255, 0.8),
              // colorBlendMode: BlendMode.dstATop,),
              FlutterLogo(
            style: FlutterLogoStyle.stacked,
          ),
        ),
      ),
    );
  }

  // Future takePhoto2() async {
  //
  //   try{
  //     final image2 = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image2 == null) return;
  //
  //     _image = image2;
  //     final imageTemporary = File(image2.path);
  //     setState(() {
  //       this.image2 = imageTemporary;
  //     });
  //   }  catch (e){
  //     print('Failed to pick image: $e');
  //   }
  // }

  pickImage2() async {
    final image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      _image1 = image;
      imgname = image.name;
      var t = await image.readAsBytes();
      imgBytes2 = Uint8List.fromList(t);
      print("image byte: $imgBytes2");
    } else {
      print("Image not selected");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stamp Imager"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _imageWidget(),
              SizedBox(height: 10),
              _buttonTakePicture()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonTakePicture() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        // Row(children: [
        //   Expanded(child: ElevatedButton(
        //   onPressed: () => pickImage2(),
        //   style: ElevatedButton.styleFrom(
        //     primary: Colors.blue,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(5),
        //     ),
        //   ),
        //   child: Text(
        //     "Pick watermark image",
        //     style: TextStyle(color: Colors.white, fontSize: 20),
        //   ),
        // ),
        //   ),
        //   Text(imgname),
        // ]
        // ),

        ElevatedButton(
          onPressed: () => takePicture(),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text(
            "Pick image",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ]),
    );
  }

  Widget _imageWidget() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      child: image != null ? Image.file(image!) : SizedBox(),
    );
  }
}
