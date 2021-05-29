import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import './result.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File _video;
  final picker = ImagePicker();
  int uploaded;
  VideoPlayerController _videoPlayerController;

  Future<String> uploadImage(filename, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('video', filename));
    var res = await request.send();
    return res.reasonPhrase;
  }

  void getResult(bool anomaly){
    Timer(const Duration(seconds: 1), () {
      (!anomaly)
          ? Navigator.push(
        context,
        // No Anomaly Detected
        MaterialPageRoute(builder: (context) => Result(false)),
      )
          : Navigator.push(
        context,
        // Anomaly Detected
        MaterialPageRoute(builder: (context) => Result(true)),
      );
    });
  }

  Future getVideo() async {
    var dio = Dio();
    Response response;
    bool anomaly = true;

    setState(() {
      _video = null;
      _videoPlayerController = null;
      uploaded = 0;
    });

    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    _video = File(pickedFile.path);

    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.setVolume(0.0);
        _videoPlayerController.addListener(() {});
        _videoPlayerController.setLooping(false);
      });

    if (_video != null) {
      setState(() {
        uploaded = 2;
      });
    }
    // print(_video.path);
    // print(pickedFile.path);


    var formData = FormData.fromMap({
      'fileName': (pickedFile.path.split('/').last).toString(),
      'multipartFile': await MultipartFile.fromFile(_video.path,
          filename: pickedFile.path.split('/').last)
    });
    print((pickedFile.path.split('/').last).toString());
    try {
      response = await dio.post(
          'http://82cb192a1c95.ngrok.io/AnomalyDetection/get/media',
          data: formData);
      print("Response");
      if (response.statusCode == 200) {
        setState(() {
          uploaded = 1;
          print(response.statusCode);
          print(response.data);
          getResult(anomaly);
        });
      } else {
        setState(() {
          uploaded = 3;
          print(response.statusCode);
          print(response.data);
        });
      }
    } on Exception catch (_) {
      setState(() {
        uploaded = 3;
        getResult(anomaly);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.black12,
        padding: EdgeInsets.only(top: statusBarHeight),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.05,
              ),
              Container(
                height:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? size.height * 0.3
                        : size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/src/images/logo.png'),
                      fit: BoxFit.fitHeight),
                ),
              ),
              Container(
                height: size.height * 0.05,
              ),
              GestureDetector(
                onTap: getVideo,
                child: Container(
                  width: (MediaQuery.of(context).orientation ==
                          Orientation.portrait)
                      ? size.width * 0.5
                      : size.width * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Container(
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 0,
                    ),
                    child: Text(
                      "UPLOAD VIDEO",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: (MediaQuery.of(context).orientation ==
                                Orientation.portrait)
                            ? 18
                            : 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: (MediaQuery.of(context).orientation ==
                          Orientation.portrait)
                      ? size.width * 0.5
                      : size.width * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Container(
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 0,
                    ),
                    child: Text(
                      "BACK",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: (MediaQuery.of(context).orientation ==
                                Orientation.portrait)
                            ? 18
                            : 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
              ),
              (_video == null)
                  ? Container(
                      child: (MediaQuery.of(context).orientation ==
                              Orientation.portrait)
                          ? Text(
                              "No Video Selected!",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                height: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : Text(
                              "No Video Selected!",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 19,
                                height: 1.2,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                    )
                  : (_videoPlayerController.value.isInitialized &&
                          uploaded == 2)
                      ? Container(
                          child: (MediaQuery.of(context).orientation ==
                                  Orientation.portrait)
                              ? Text(
                                  "Uploading!",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  "Uploading!",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 19,
                                    height: 1.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                        )
                      //     ? Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      //   child: AspectRatio(
                      //     aspectRatio:
                      //     _videoPlayerController.value.aspectRatio,
                      //     child: VideoPlayer(_videoPlayerController),
                      //   ),
                      // )
                      : (_videoPlayerController.value.isInitialized &&
                              uploaded == 1)
                          ? Container(
                              child: (MediaQuery.of(context).orientation ==
                                      Orientation.portrait)
                                  ? Text(
                                      "Uploaded!",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        height: 1.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  : Text(
                                      "Uploaded!",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 19,
                                        height: 1.2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                            )
                          : (_videoPlayerController.value.isInitialized &&
                                  uploaded == 3)
                              ? Container(
                                  child: (MediaQuery.of(context).orientation ==
                                          Orientation.portrait)
                                      ? Text(
                                          "Uploading Failed!",
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 20,
                                            height: 1.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      : Text(
                                          "Uploading Failed!",
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 19,
                                            height: 1.2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                )
                              : Container(),
              Container(
                height: size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
