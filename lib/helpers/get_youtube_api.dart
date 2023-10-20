import 'package:dio/dio.dart';
import 'package:video_app/models/youtube_response_model.dart';

class GetYoutubeApi{
  final dio = Dio();
  Future<YoutubeResponse> searchVideos(String query) async {

print("____________aqui si llega");
final url = Uri.https(
  "youtube.googleapis.com",
  "/youtube/v3/search",
  {
    'maxResults': '20',
        'q': query,
        'key': "AIzaSyDLay70CqdACzpVgN9O4h6Zyh1c8kNoXTE",
        'part': 'snippet',
  }
);

    final response = await dio.get(url.toString());
    print("_:::::::::::______________:::::::::_____________-");
    print(response.toString());
    final videoResponseModel = YoutubeResponse.fromJson(response.data);
    
    return videoResponseModel;
  }
}