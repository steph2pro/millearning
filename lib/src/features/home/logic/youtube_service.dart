// import 'dart:io';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:millearnia/src/features/home/logic/key.dart';
// import 'package:millearnia/src/features/home/models/chanel_model.dart';
// import 'package:millearnia/src/features/home/models/video.dart';

// class ApiService {
//   ApiService._instantiate();
//   static final ApiService instance = ApiService._instantiate();

//   final String _baseUrl='https://www.googleapis.com/';
//   String _nextPageToken='';

//   Future<ChanelModel> fetchChannel({required String channelId}) async{
//     Map<String, String> parameters={
//       'part':'snippet, contenDetails, statistcs',
//       'id':channelId,
//       'key': API_KEY,
//     }; 
//     Uri uri=Uri.https(
//       _baseUrl,
//       'youtube/v3/channels',
//       parameters,
//     );
//     Map<String,String> headers={
//       HttpHeaders.contentTypeHeader:'application/json',
//     };
//     // get channel
//     var response=await http.get(uri,headers:headers);
//     if(response.statusCode == 200){
//       Map<String,dynamic> data= json.decode(response.body)['items'][0];
//       ChanelModel chanelModel=ChanelModel.fromMap(data);
//       // fetch first batch of videos from uploads playlist
//       chanelModel.videos= await fetchVideosFromPlaylist(
//         playlistId:chanelModel.uploadPlaylistId,
//       );
//       return chanelModel;
//     }else{
//       throw json.decode(response.body)['error']['message'];
//     }
//   }
//   Future<List<Video>> fetchVideosFromPlaylist({required String playlistId}) async {
//     // Implémentez ici votre logique pour récupérer les vidéos à partir de la playlist
//     Map<String,String> parameters={
//       'part':'snippet',
//       'playlistId':playlistId,
//       'maxResults':'8',
//       'pageToken':_nextPageToken,
//       'key':API_KEY,
//     };
//     Uri uri=Uri.https(
//       _baseUrl,
//       'youtube/v3/playlistItems',
//       parameters,
//     );
//     Map<String,String> headers={
//       HttpHeaders.contentTypeHeader:'application/json',
//     };
//     //get playlist videos
//     var response =await http.get(uri,headers: headers);
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       _nextPageToken = data['nextPageToken'] ?? '';
//       List<dynamic> videosJson=data['items'];
//       //Fetch first eight videos from uploads playlist
//       List<Video> videos=[];
//       videosJson.forEach(
//         (json) => videos.add(
//           Video.fromMap(json['snippet']),
//         ));
//       return videos;
//     } else {
//       throw json.decode(response.body)['error']['message'];
//     }
//   }

// }
import 'package:dio/dio.dart';
import 'package:millearnia/src/features/home/logic/key.dart';

class YouTubeService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>?> fetchVideoDetails(String videoId) async {
    final apiKey = API_KEY;
    final url =
        'https://www.googleapis.com/youtube/v3/videos?id=$videoId&key=$apiKey&part=snippet,statistics';

    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data['items'] as List;
        if (data.isNotEmpty) {
          return data.first;
        }
      }
    } catch (e) {
      print('Error fetching video details: $e');
    }
    return null;
  }
}
