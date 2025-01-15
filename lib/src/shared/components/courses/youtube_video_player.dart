import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:millearnia/src/features/home/logic/youtube_service.dart';
import 'package:millearnia/src/shared/utils/download_service.dart';
import 'package:millearnia/src/shared/utils/permition_storage.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  final String videoId;

  const YoutubeVideoPlayer({Key? key, required this.videoId}) : super(key: key);

  @override
  _YoutubeVideoPlayerState createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  late YoutubePlayerController _controller;
   Map<String, dynamic>? videoDetails;
  bool isLoading = true;

  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
   double _progress = 0.0; // Variable pour suivre la progression
  String? _statusMessage;
  bool _isSuccess = false;
   String? _downloadedFilePath; // Chemin du fichier téléchargé
  VideoPlayerController? _videoPlayerController; // Contrôleur pour la vidéo locale
 bool _isFullScreen = false;

 
  @override
  void initState() {
    super.initState();
//*initialisation du controlleur */

    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        hideControls: true,
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


    _controller.addListener(() {
      setState(() {
        _isPlaying = _controller.value.isPlaying;
        _currentPosition = _controller.value.position;
        _totalDuration = _controller.metadata.duration;
      });
    });
  }

 
   Future<void> _downloadVideo() async {
    final permission = await requestManageStoragePermission();
    if (permission) {
      const fileUrl =
          'https://eiwdwnllcxkqgqapkbvx.supabase.co/storage/v1/object/public/video/AlanWalker_MaxAlone.zip';
      setState(() {
        _progress = 0.0; // Réinitialiser la progression
      });

      final filePath = await DownloadService.downloadFile(
        fileUrl,
        onProgress: (progress) {
          setState(() {
            _progress = progress; // Mettre à jour la progression
          });
        },
      );

      if (filePath != null) {
        setState(() {
          _downloadedFilePath = filePath; // Stocker le chemin du fichier
          _initializeLocalVideoPlayer(filePath); // Initialiser le lecteur local
          print('[video player] $_downloadedFilePath');
        });
      } else {
        print("Échec du téléchargement.");
      }
    } else {
      print("Permission de stockage refusée.");
    }
  }

  void _initializeLocalVideoPlayer(String filePath) {
    _videoPlayerController = VideoPlayerController.file(File(filePath))
      ..initialize().then((_) {
        setState(() {}); // Mise à jour de l'état après l'initialisation
      });
  }

   void _toggleFullScreen() {
    setState(() {
      if (!_isFullScreen) {
        // Passer en plein écran avec orientation paysage
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        // Retourner à l'orientation portrait par défaut
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }

      _isFullScreen = !_isFullScreen;
    });
  }
 

  @override
  void dispose() {
    _controller.dispose();
    _videoPlayerController?.dispose();
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
        

       
        if (_downloadedFilePath == null) ...[
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
        const SizedBox(height: 10),
        if (_progress > 0)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_progress < 1.0) ...[
                  Text(
                    "Téléchargement en cours",
                    style: context.textTheme.bodySmall!.copyWith(
                      fontSize: 14,
                      color: context.colorScheme.surface,
                    ),
                  ),
                  const SizedBox(height: 10), // Espacement entre le texte et la barre
                  Stack(
                    alignment: Alignment.center, // Place le texte au centre
                    children: [
                      SizedBox(
                        width: 50, // Largeur du cercle
                        height: 50, // Hauteur du cercle
                        child: CircularProgressIndicator(
                          value: _progress, // La progression (entre 0.0 et 1.0)
                          strokeWidth: 5.0, // Épaisseur de la bordure
                        ),
                      ),
                      Text(
                        "${(_progress * 100).toStringAsFixed(0)}%", // Convertir la progression en pourcentage
                        style: context.textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          color: context.colorScheme.surface,
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  Text(
                    "Téléchargement terminé",
                    style: context.textTheme.bodySmall!.copyWith(
                      fontSize: 14,
                      color: context.colorScheme.surface,
                    ),
                  ),
                ],
              ],
            ),
          ),

        Positioned(
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
          ),
        ),
        const SizedBox(height: 10),
        Positioned(
          top: 95,
          left: 80,
          right: 80,
          child: GestureDetector(
            onTap: _isPlaying ? _controller.pause : _controller.play,
            onDoubleTap: _toggleFullScreen,
            child: Container(
              decoration: BoxDecoration(
                color: context.colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      _isPlaying
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_fill,
                      color: context.colorScheme.surface,
                      size: 30,
                    ),
                    onPressed: () {
                      _isPlaying ? _controller.pause() : _controller.play();
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
              ),
            ),
          ),
        ),
          Positioned(
                    bottom: 40,
                    right: 10,
                    child: IconButton(
                      icon: Icon(
                        _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                        color: context.colorScheme.onPrimary,
                      ),
                      onPressed: _toggleFullScreen,
                    ),
                  ),
          Positioned(
          bottom: 40,
          right: 35,
          child: IconButton(
            icon:  Icon(
              Icons.download,
              color: context.colorScheme.onPrimary,
              ),
            onPressed: _downloadVideo,
          ),
        ),
       


        ] else ...[
          // SizedBox(
          //   width: double.infinity,
          //   height: 200,
          //   child: 
            _isFullScreen
                      ? Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: AspectRatio(
                              aspectRatio: _videoPlayerController!.value.aspectRatio,
                              child: VideoPlayer(_videoPlayerController!),
                            ),
                          ),
                        )
                      : 
            AspectRatio(
              aspectRatio: _videoPlayerController!.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController!),
              )
           
          // )
         ,
          
          Positioned(
          left: 10,
          right: 10,
          bottom: 0,
          child:VideoProgressIndicator(_videoPlayerController!, allowScrubbing: true),
          // Slider(
          //   value: _videoPlayerController!.value.position.inSeconds.toDouble(),
          //   max: _videoPlayerController!.value.duration.inSeconds.toDouble(),
          //   onChanged: (value) {
          //     _videoPlayerController!.seekTo(Duration(seconds: value.toInt()));
          //   },
          // )
          )
          ,

           Positioned(
          top: 95,
          left: 80,
          right: 80,
          child:
          IconButton(
            icon: Icon(
              _videoPlayerController!.value.isPlaying
                  ? Icons.pause_circle_filled
                  : Icons.play_circle_fill,
                  size: 40,
            ),
            onPressed: () {
              setState(() {
                if (_videoPlayerController!.value.isPlaying) {
                  _videoPlayerController!.pause();
                } else {
                  _videoPlayerController!.play();
                }
              });
            },
          ),
           ),

                  Positioned(
                    bottom: 50,
                    right: 10,
                    child: IconButton(
                      icon: Icon(
                        _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                        color: Colors.transparent,
                      ),
                      onPressed: _toggleFullScreen,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: IconButton(
                      icon: Icon(
                        _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                        color: Colors.white,
                      ),
                      onPressed: _toggleFullScreen,
                    ),
                  ),

        ],
        

        // Ajout du bouton pour basculer en mode plein écran
        
      ],
    );
  }
}
