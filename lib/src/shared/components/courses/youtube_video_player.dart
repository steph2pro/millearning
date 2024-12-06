import 'package:flutter/material.dart';
import 'package:millearnia/src/shared/components/modals/error_toast_widget.dart';
import 'package:millearnia/src/shared/components/modals/modal.dart';
import 'package:millearnia/src/shared/components/modals/progress/download_progress_widget.dart';
import 'package:millearnia/src/shared/utils/download_service.dart';
import 'package:millearnia/src/shared/utils/file_utils.dart';
import 'package:millearnia/src/shared/utils/permition_storage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
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
   double _progress = 0.0;
  String? _statusMessage;
  bool _isSuccess = false;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        hideControls: true,
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
   void _downloadVideo() async {
    final permission= await requestManageStoragePermission();
    print(permission);
    if (permission) {
    

    // DownloadProgressWidget(progress: 20);
    // CircularProgressIndicator(value: 20);
    const fileUrl = 'https://eiwdwnllcxkqgqapkbvx.supabase.co/storage/v1/object/public/video/AlanWalker_MaxAlone.7z';
    final filePath = await DownloadService.downloadFile(fileUrl);

    if (filePath != null) {
      showSuccesModal('telechargement'); 
      print("Téléchargement terminé : $filePath");
    } else {
      print("Échec du téléchargement.");
    }
    // try {
      // final filePath = await DownloadService.downloadFile(
      //   fileUrl: fileUrl,
      //   minSpaceMB: 100, // Vérifiez 100 Mo d'espace libre
      //   onProgress: (progress) {
      //     setState(() {
      //       _progress = progress;
      //     });
      //   },
      // );
      
    print('chargement'); 
       
    } else {
      print("Permission de stockage refusée.");
    }

    //   print('download');
    //   if (filePath != null) {
    //     // Décompression après le téléchargement
    //     final outputDir = await FileUtils.unzipFile(filePath);
    //     _showToast("Fichier décompressé avec succès : $outputDir", isSuccess: true);
    //   } else {
    //     _showToast("Le téléchargement a échoué.", isSuccess: false);
    //   }
    // } catch (e) {
    //   _showToast("Erreur : $e", isSuccess: false);
    // }
        
  }
    
  //  void _showToast(String message, {required bool isSuccess}) {
  //   setState(() {
  //     _statusMessage = message;
  //     _isSuccess = isSuccess;
  //   });
  // }

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
          // Widget de progression
          // if (_progress > 0.0 && _progress < 1.0)
          //   DownloadProgressWidget(progress: _progress),

          // // Affichage des messages
          // if (_statusMessage != null)
          //   ErrorToasWidget(
          //     title: _statusMessage!,
          //     duration: const Duration(seconds: 5),
          //     isSuccessCheck: _isSuccess,
          //   ),

        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {
            debugPrint('YouTube Player is ready.');
          },
        ),
        const SizedBox(height: 10),
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
        // Ajout du bouton pour basculer en mode plein écran
        Positioned(
          bottom: 50,
          right: 10,
          child: Icon(
              Icons.fullscreen,
              color: context.colorScheme.onPrimary,
            ),
          ),
          Positioned(
          bottom: 40,
          right: 30,
          child: IconButton(
            icon:  Icon(
              Icons.download,
              color: context.colorScheme.onPrimary,
              ),
            onPressed: _downloadVideo,
          ),
        ),
       
      ],
    );
  }
}
