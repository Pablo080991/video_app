import 'package:flutter/material.dart';
import 'package:video_app/helpers/get_youtube_api.dart';
import 'package:video_app/models/youtube_response_model.dart';

class VideoProvider extends ChangeNotifier {
  final getVideoList = GetYoutubeApi();
  
  List<Item> videoList = [];
  
  Future<void> videoResponse(String query) async {
    final videoListResponse = await getVideoList.searchVideos(query);
    videoList = (videoListResponse.items)!;
    print(videoList.toString());
    notifyListeners(); 
  }


}