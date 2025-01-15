import 'package:flutter/material.dart';
import 'package:millearnia/src/features/home/logic/youtube_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class CourseVideo extends StatefulWidget {
  final String videoId;

  const CourseVideo({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  @override
  _CourseVideoState createState() => _CourseVideoState();
}

class _CourseVideoState extends State<CourseVideo> {
  late YoutubePlayerController _controller;
  Map<String, dynamic>? videoDetails;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    _fetchVideoDetails();
  }

  Future<void> _fetchVideoDetails() async {
    final service = YouTubeService();
    final details = await service.fetchVideoDetails(widget.videoId);
    if (details != null) {
      setState(() {
        videoDetails = details;
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
              if (videoDetails != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        videoDetails!['snippet']['title'],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(videoDetails!['snippet']['description']),
                      const SizedBox(height: 16),
                      Text('Vues : ${videoDetails!['statistics']['viewCount']}'),
                      Text('Likes : ${videoDetails!['statistics']['likeCount']}'),
                    ],
                  ),
                ),
            ],
          );
  }
}
