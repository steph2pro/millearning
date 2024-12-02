import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const YoutubeVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _YoutubeVideoPlayerState createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  late YoutubePlayerController _controller;
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        hideControls: true, // Cache les contrôles natifs de YouTube
      ),
    );

    _controller.addListener(() {
      setState(() {
        _isPlaying = _controller.value.isPlaying;
        _currentPosition = _controller.value.position;
        _totalDuration = _controller.metadata.duration;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds % 60);
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true, // Cache l'indicateur natif =false
          onReady: () {
            debugPrint('YouTube Player is ready.');
          },
        ),
        const SizedBox(height: 10),
        // Barre de progression
        Positioned(
          // top: 150,
          left: 10,
          right: 10,
          bottom: 0,
          child: Row(
          children: [
            Text(
              _formatDuration(_currentPosition),
              style: context.textTheme.bodySmall!.copyWith(
                fontSize: 12,
                color: context.colorScheme.surface,
              ),
            ),
            Expanded(
              child: Slider(
                value: _currentPosition.inSeconds.toDouble(),
                max: _totalDuration.inSeconds.toDouble(),
                onChanged: (value) {
                  _controller.seekTo(Duration(seconds: value.toInt()));
                },
              ),
            ),
            Text(
              _formatDuration(_totalDuration),
              style: context.textTheme.bodySmall!.copyWith(
                fontSize: 12,
                color: context.colorScheme.surface,
              ),
            ),
          ],
        )
        ),
        const SizedBox(height: 10),
        // Boutons de contrôle
         Positioned(
          top: 150,
          left: 120,
          right: 120,
          child:
           !_isPlaying ? GestureDetector(
            onTap: (){
              _controller.play();
            },
            child: Container(
            // padding: EdgeInsets.all(0),
            width: 20,
            // height: 50,
            decoration: BoxDecoration(
              color: context.colorScheme.tertiaryContainer, // Fond bleu
              borderRadius: BorderRadius.circular(10),
             ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          IconButton(
              icon: Icon(Icons.play_circle_fill, color: context.colorScheme.surface, size: 30,), // Icône blanche
              onPressed: () {
                _controller.play();
              },
            ),
           Text(
            'Course Preview',
            style: context.textTheme.bodySmall!.copyWith(
              fontSize: 12,
              color: context.colorScheme.surface,
            ),
          ),
              
              
            ],
          )
          ),
          )
          : GestureDetector(
            onTap: (){
              _controller.pause();
            },
            child: Container(
            // padding: EdgeInsets.all(0),
            width: 20,
            // height: 50,
            decoration: BoxDecoration(
              color: context.colorScheme.tertiaryContainer, // Fond bleu
              borderRadius: BorderRadius.circular(10),
             ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          IconButton(
              icon: Icon( Icons.pause_circle_filled, color: context.colorScheme.surface, size: 30,), // Icône blanche
              onPressed: () {
                _controller.pause();
              },
            ),
           IconButton(
              icon: Icon( Icons.stop_circle, color: context.colorScheme.surface, size: 30,), // Icône blanche
              onPressed: () {
                _controller.pause();
                _controller.seekTo(const Duration(seconds: 0));
              },
            ),
              
              
            ],
          )
          ),
          )
        ),
        // Positioned(
        //   bottom: 20,
        //   child: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     IconButton(
        //       icon: Icon(
        //         _isPlaying ? Icons.pause : Icons.play_arrow,
        //         size: 30,
        //         color: Colors.red,
        //       ),
        //       onPressed: () {
        //         if (_isPlaying) {
        //           _controller.pause();
        //         } else {
        //           _controller.play();
        //         }
        //       },
        //     ),
        //     IconButton(
        //       icon: const Icon(Icons.stop, size: 30, color: Colors.red),
        //       onPressed: () {
        //         _controller.pause();
        //         _controller.seekTo(const Duration(seconds: 0));
        //       },
        //     ),
        //   ],
        // ),
        //   )
      ],
    );
  }
}
