class Video {
  final String id;
  final String title;
  final String thumbnaiUrl;
  final String channelTitle;
  Video({
    required this.id,
    required this.title,
    required this.thumbnaiUrl,
    required this.channelTitle,
  });
  factory Video.fromMap(Map<String, dynamic> map){
    return Video(
      id:map['ressource']['videoId'],
      title: map['title'], 
      thumbnaiUrl: map['thumbnails']['high']['url'],
       channelTitle: map['channelTitle'],
       );
  }

}