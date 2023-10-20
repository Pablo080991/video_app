
import 'package:flutter/material.dart';
import 'package:video_app/presentation/videoView/video_view.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
       leading: const Padding(
        padding: EdgeInsets.all(4.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://seeklogo.com/images/Y/youtube-square-logo-3F9D037665-seeklogo.com.png"),
        ),
       ),
       title: const Text("Youtube list"),
       centerTitle: false,
      ),
      body: const VideoView(),
    );
  }
}

