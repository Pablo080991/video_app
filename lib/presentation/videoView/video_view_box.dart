import 'package:flutter/material.dart';
import 'package:video_app/models/youtube_response_model.dart';

class VideoViewBox extends StatelessWidget {
  final Item video;
  const VideoViewBox({
    super.key, 
    required this.video, 
    });

 @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), // Bordes redondeados
          boxShadow: const [
            BoxShadow(
              color: Colors.grey, // Color de la sombra
              offset: Offset(0, 1), // Desplazamiento de la sombra
              blurRadius: 1, // Radio de desenfoque
            ),
          ],
          color: Colors.white, // Color de fondo del contenedor
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _ImageVideo(videoImageURL: video.snippet?.thumbnails?.medium?.url ?? ""),
            const SizedBox(height: 10), // Espacio entre la imagen y el texto
            Text(video.snippet?.title ?? "", 
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      ],
    );
  }
}



class _ImageVideo extends StatelessWidget {
  final String videoImageURL;

  const _ImageVideo({required this.videoImageURL});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),

      child: Image.network(videoImageURL,
      width: size.width,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        else {
          return Container(
            width: size.width,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text("loading image..."),
          );
        }
      },)
      );
  }
}