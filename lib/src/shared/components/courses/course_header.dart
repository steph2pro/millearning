import 'package:flutter/material.dart';
import 'package:millearnia/src/core/application.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/components/courses/youtube_video_player.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

// Course Header Widget
class CourseHeader extends StatelessWidget {
  final String videoUrl;
  // final String title;
  // final double rating;
  final VoidCallback? back;

  const CourseHeader({
    required this.videoUrl,
    // required this.title,
    // required this.rating,
     this.back,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset(videoUrl, width: double.infinity, height: 300, fit: BoxFit.cover),
        YoutubeVideoPlayer(videoUrl: videoUrl),
        Positioned(
          top: 20,
          left: 16,
          child: 
          // Icon(Icons.arrow_back, color: Colors.white),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: context.colorScheme.surface, // Fond bleu
              shape: BoxShape.circle,
             ),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: context.colorScheme.onSurface,size: 20,), // Icône blanche
              onPressed: back,
            ),
           ),
        ),
        Positioned(
          top: 20,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: context.colorScheme.surface, // Fond bleu
              shape: BoxShape.circle,
             ),
            child: IconButton(
              icon: Icon(Icons.share, color: context.colorScheme.onSurface,size: 20,), // Icône blanche
              onPressed: () {
              },
            ),
           ),
           gapW10,
            Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: context.colorScheme.surface, // Fond bleu
              shape: BoxShape.circle,
             ),
            child: IconButton(
              icon: Icon(Icons.more_vert, color: context.colorScheme.onSurface,size: 20,), // Icône blanche
              onPressed: () {
              },
            ),
           ),
             
            ],
          ),
        ),
        // Positioned(
        //   top: 150,
        //   left: 120,
        //   right: 120,
        //   child: Container(
        //     // padding: EdgeInsets.all(0),
        //     width: 20,
        //     // height: 50,
        //     decoration: BoxDecoration(
        //       color: context.colorScheme.tertiaryContainer, // Fond bleu
        //       borderRadius: BorderRadius.circular(10),
        //      ),
        //     child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //   IconButton(
        //       icon: Icon(Icons.play_circle_fill, color: context.colorScheme.surface, size: 30,), // Icône blanche
        //       onPressed: () {
        //       },
        //     ),
        //    Text(
        //     'Course Preview',
        //     style: context.textTheme.bodySmall!.copyWith(
        //       fontSize: 12,
        //       color: context.colorScheme.surface,
        //     ),
        //   ),
              
              
        //     ],
        //   )
        //   )
        // ),
      ],
    );
  }
}
