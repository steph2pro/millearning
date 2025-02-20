import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/components/courses/about_course.dart';
import 'package:millearnia/src/shared/components/courses/course_header.dart';
import 'package:millearnia/src/shared/components/courses/course_tabs.dart';
import 'package:millearnia/src/shared/components/courses/course_title.dart';
import 'package:millearnia/src/shared/components/courses/menu.dart';
import 'package:millearnia/src/shared/components/courses/prise.dart';
import 'package:millearnia/src/shared/components/courses/youtube_video_player.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:millearnia/src/shared/components/modals/progress/download_progress_widget.dart';

import 'package:millearnia/src/features/home/models/profession.dart';

@RoutePage()
class ProfessionsDetailScreen extends StatefulWidget {
  final Profession profession; // Prend la profession en paramètre

  const ProfessionsDetailScreen({
    super.key,
    required this.profession,
  });

  @override
  State<ProfessionsDetailScreen> createState() =>
      _ProfessionsDetailScreenState();
}

class _ProfessionsDetailScreenState extends State<ProfessionsDetailScreen> {
  int _currentIndex = 0;
  double progress = 0.0;

  void startDownload() {
    Future.delayed(Duration(milliseconds: 500), () {
      if (progress < 1.0) {
        if (mounted) {
          setState(() {
            progress += 0.1;
          });
        }
        startDownload();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startDownload();
  }

  void _onMenuItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final profession = widget.profession;
    final videos = profession.videos;
    final firstVideo = videos.isNotEmpty ? videos.first : null;
    final otherVideos = videos.length > 1 ? videos.sublist(1) : [];

    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      body: SafeArea(
        child: ListView(
          children: [
            if (firstVideo != null) 
              CourseHeader(
                videoId: firstVideo.youtubeId, // ID de la première vidéo
                back: () => context.router.maybePop(),
              ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CourseTitle(
                    title: profession.name,
                    reviews: 356,
                    start: 4.6,
                    name: profession.user.name,
                    lessons: profession.videos.length,
                    certification: 0,
                  ),
                  gapH20,
                  Menu(
                    items: ['About', 'other video', 'Reviews'],
                    onItemSelected: _onMenuItemSelected,
                  ),
                  gapH20,
                  IndexedStack(
                    index: _currentIndex,
                    children: [
                      AboutCourseSection(
                        description: "Description de ${profession.name}",
                        tutorName: profession.user.name,
                        tutorRole: "Expert en ${profession.name}",
                        tutorImageUrl: profession.user.profil,
                        info: {
                          "Category": profession.categoryId.toString(),
                          "Videos": profession.videos.length.toString(),
                        },
                      ),
                      Column(
                        children: otherVideos
                            .map(
                              (video) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child:Column(
                                  children: [
                                     YoutubeVideoPlayer(videoId: video.youtubeId),
                                     Text(
                                      '${profession.name} : ${video.title}',
                                      style: context.textTheme.titleMedium
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      Center(child: Text("Reviews Content")),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: PriceAndEnrollButton(totalPrice: 180.00,onPressed: (){},),
      ),
    );
  }
}
