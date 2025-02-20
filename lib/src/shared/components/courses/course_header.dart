import 'package:flutter/material.dart';
import 'package:millearnia/src/shared/components/courses/youtube_video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseHeader extends StatelessWidget {
  final String videoId;
  final VoidCallback back;
  final String? thumbnailImage; // Optionnel

  const CourseHeader({
    super.key,
    required this.videoId,
    required this.back,
    this.thumbnailImage, // Paramètre optionnel
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Affiche l'image si elle est définie, sinon affiche le lecteur YouTube
        if (thumbnailImage != null)
          Image.network(
            thumbnailImage!,
            width: double.infinity,
            height: 200, // Ajuste la hauteur selon le design
            fit: BoxFit.cover,
          )
        else
          // YoutubePlayer(
          //   controller: YoutubePlayerController(
          //     initialVideoId: videoId,
          //     flags: const YoutubePlayerFlags(autoPlay: false),
          //   ),
          //   showVideoProgressIndicator: true,
          // ),
          YoutubeVideoPlayer(videoId: videoId,),

        // Bouton retour
        Positioned(
          top: 16,
          left: 16,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: back,
          ),
        ),
      ],
    );
  }
}
