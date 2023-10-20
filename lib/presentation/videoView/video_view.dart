import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:video_app/presentation/videoView/video_player_view.dart';
import 'package:video_app/presentation/videoView/video_view_box.dart';
import 'package:video_app/widgets/search_field_box.dart';
import 'package:video_app/provider/video_provider.dart';

class VideoView extends StatelessWidget {
  const VideoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    final videoProvider = context.watch<VideoProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: videoProvider.videoList.length,
              itemBuilder: (context, index) {
                final video = videoProvider.videoList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                     MaterialPageRoute(
                      builder: (context) => VideoPlayerView(video: video),
                      )
                     );
                  },
                  child: VideoViewBox(video: video)
                );
            })
            ),
            SearchFieldBox(onValue: (value) => videoProvider.videoResponse(value)),
          ],
        ),
      ),
    );
  }
}

