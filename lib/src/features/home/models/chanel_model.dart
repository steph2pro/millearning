import 'package:millearnia/src/features/home/models/video.dart';

class ChanelModel {
  final String id;
  final String title;
  final String profilePictureUrl;
  final String subscriberCount;
  final String videoCount;
  final String uploadPlaylistId;
   List<Video>? videos;

  ChanelModel({
    required this.id,
    required this.title,
    required this.profilePictureUrl,
    required this.subscriberCount,
    required this.videoCount,
    required this.uploadPlaylistId,
     this.videos,

  });
  factory ChanelModel.fromMap(Map<String, dynamic> map){
    return ChanelModel(
      id:map['id'],
      title:map['snippet']['title'],
      profilePictureUrl: map['snippet']['thumbnails']['default']['url'],
      subscriberCount: map['statistics']['subscriberCount'],
      videoCount:  map['statistics']['videoCount'],
      uploadPlaylistId: map['contentDetails']['relatedPlaylists']['uploads']['likes']['favorites']['watchHistory']['watchLater'],
    );
  }
}