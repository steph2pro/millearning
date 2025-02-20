// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:millearnia/src/core/theme/app_size.dart';
// import 'package:millearnia/src/shared/components/courses/about_course.dart';
// import 'package:millearnia/src/shared/components/courses/course_header.dart';
// import 'package:millearnia/src/shared/components/courses/course_tabs.dart';
// import 'package:millearnia/src/shared/components/courses/course_title.dart';
// import 'package:millearnia/src/shared/components/courses/menu.dart';
// import 'package:millearnia/src/shared/components/courses/prise.dart';
// import 'package:millearnia/src/shared/components/courses/youtube_video_player.dart';
// import 'package:millearnia/src/shared/extensions/context_extensions.dart';
// import 'package:millearnia/src/shared/components/modals/progress/download_progress_widget.dart';

// @RoutePage()
// class CourseDetailScreen extends StatefulWidget {
//   const CourseDetailScreen({super.key});

//   @override
//   State<CourseDetailScreen> createState() => _CourseDetailScreenState();
// }

// class _CourseDetailScreenState extends State<CourseDetailScreen> {
//   final TextEditingController _searshController = TextEditingController();
//   int _currentIndex = 0;
//   double progress = 0.0;

//   // Simulation d'une progression de téléchargement
//   void startDownload() {
//     Future.delayed(Duration(milliseconds: 500), () {
//       if (progress < 1.0) {
//         if (mounted) { // Vérifiez si le widget est encore monté avant d'appeler setState
//           setState(() {
//             progress += 0.1; // Augmente la progression
//           });
//         }
//         startDownload(); // Continue jusqu'à 100%
//       }
//     });
//   }

//   final List<Widget> _pages = [
//     AboutCourseSection(
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//       tutorName: "Robert Green",
//       tutorRole: "Design Tutor",
//       tutorImageUrl: "assets/images/profile1.png",
//       info: {
//         "Students": "156,213",
//         "Language": "English",
//         "Last update": "Feb 2, 2023",
//         "Level": "Beginner",
//         "Access": "Mobile, Desktop",
//       },
//     ),
//     Center(child: Text("Lessons Content")),
//     Center(child: Text("Reviews Content")),
//   ];

//   void _onMenuItemSelected(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   void dispose() {
//     _searshController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     startDownload();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   automaticallyImplyLeading: false,
//       //   toolbarHeight: 0,
//       //   // backgroundColor: Colors.transparent,
//       // ),
//       backgroundColor: context.colorScheme.onPrimary,

//       body: SafeArea(
//         child: ListView(
//           children: [
//             Column(
//               children: [
//                 // Header Section
//                 CourseHeader(
//                   videoId: 'T20fz20cjYE',
//                   back: () {
//                     context.router.popForced();
//                   },
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(24),
//                   child: Column(
//                     children: [
//                       CourseTitle(
//                         title: 'Design Thinking Fundamental',
//                         reviews: 356,
//                         start: 4.6,
//                         name: 'Robert Green',
//                         lessons: 32,
//                         certification: 0,
//                       ),
//                       gapH20,
//                       Menu(
//                         items: ['About', 'Lessons', 'Reviews'],
//                         onItemSelected: _onMenuItemSelected,
//                       ),
//                       gapH20,
//                       _pages[_currentIndex],
//                       // Expanded(
//                       //   child: _pages[_currentIndex],
//                       // ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: PriceAndEnrollButton(totalPrice: 180.00),
//       ),
//     );
//   }
// }
