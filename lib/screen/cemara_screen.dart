import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class VideoPickerAndPlayer extends StatefulWidget {
  @override
  _VideoPickerAndPlayerState createState() => _VideoPickerAndPlayerState();
}

class _VideoPickerAndPlayerState extends State<VideoPickerAndPlayer> {
  late VideoPlayerController _controller;
  bool _isVideoPicked = false;
  File? _videoFile;

  Future<void> _pickVideo() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
        _isVideoPicked = true;
        _controller = VideoPlayerController.file(_videoFile!)
          ..initialize().then((_) {
            setState(() {});
            _controller.setLooping(true); // Optional: To loop the video
            _controller.play(); // Automatically start playing the video
          });
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick and Play Video'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _pickVideo,
            child: Text('Select Video from Gallery'),
          ),
          SizedBox(height: 20),
          _isVideoPicked
              ? Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            child: _controller.value.isInitialized
                ? VideoPlayer(_controller)
                : Center(child: CircularProgressIndicator()),
          )
              : Center(child: Text('No video selected')),
        ],
      ),
    );
  }
}


