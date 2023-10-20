import 'package:flutter/material.dart';
import 'package:video_app/models/youtube_response_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerView extends StatelessWidget {
  final Item video;

  const VideoPlayerView({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: video.id?.videoId ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reproductor de Video'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            YoutubePlayer(
              controller: controller,
              showVideoProgressIndicator: true,
              aspectRatio: 16 / 9,
            ),
            const SizedBox(height: 10),
            Text(video.snippet?.title ?? "", 
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              Text(video.snippet?.description ?? "", 
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.start,
              ),
      
            // Aquí puedes agregar cualquier otro contenido debajo del reproductor de video, si es necesario.
          ],
        ),
      ),
    );
  }
}
