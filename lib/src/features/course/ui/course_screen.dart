import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/datasource/models/course.dart';
import 'package:millearnia/src/features/course/logic/userCourse_cubit.dart';
import 'package:millearnia/src/features/home/logic/course_cubit.dart';
import 'package:millearnia/src/shared/components/courses/menu.dart';
import 'package:millearnia/src/shared/components/home_components/course_continue.dart';
import 'package:millearnia/src/shared/components/skeleton/skeleton_loader.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  int _currentIndex = 0;
  int? userId;

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('id');
    });
    print('********* $userId ************');
  }

  @override
  void initState() {
    super.initState();
    context.read<CourseCubit>().getCourses();
    getUserData();
  }

  void _onMenuItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Courses",
          style: context.textTheme.titleLarge,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: context.colorScheme.onPrimary,
      ),
      backgroundColor: context.colorScheme.onPrimary,
      body: SafeArea(
        child: Column(
          children: [
            Menu(
              items: ['Ongoing', 'Completed'],
              onItemSelected: _onMenuItemSelected,
            ),
            gapH20,
            Expanded(
              child: FutureBuilder(
                future: getUserData(),
                builder: (context, snapshot) {
                  if (userId == null) {
                    return _buildSkeletonLoader(); // Skeleton loader if userId is null
                  }
                  return _currentIndex == 0
                      ? _MyCourses(userId: userId!)
                      : _OngoingCourses();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Skeleton loader method for FutureBuilder when user data is loading
  Widget _buildSkeletonLoader() {
    return ListView.builder(
      itemCount: 5, // You can show a fixed number of skeleton items
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Widget pour afficher les cours en cours
class _OngoingCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        return state.when(
          initial: () => SkeletonLoader(),
          loading: () => SkeletonLoader(),
          successGetCourses: (response) {
            return _buildCourseList(context, response.courses);
          },
          error: (error) => Center(child: Text('Erreur: $error')),
        );
      },
    );
  }

  static Widget _buildCourseList(BuildContext context, List<Course> courses) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return GestureDetector(
          onTap: () {
            context.router.push(CourseDetailRoute(course: course));
          },
          child: CourseContinue(
            progress: 500,
            title: course.title,
            contentImage: course.thumbnail,
            name: 'John Doe',
            btnText: 'Join',
          ),
        );
      },
    );
  }
}

/// Widget pour afficher les cours de l'utilisateur
class _MyCourses extends StatelessWidget {
  final int userId;

  const _MyCourses({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCourseCubit()..getUserCours(userId),
      child: BlocBuilder<UserCourseCubit, UserCourseState>(
        builder: (context, state) {
          return state.when(
            initial: () => SkeletonLoader(),
            loading: () => SkeletonLoader(),
            successUserCourse: (response) {
              final courses = response.userCourses.map((uc) => uc.course).whereType<Course>().toList();
              return _buildMyCourseList(context, courses);
            },
            error: (error) => Center(child: Text('Erreur: $error')),
          );
        },
      ),
    );
  }

  static Widget _buildMyCourseList(BuildContext context, List<Course> courses) {
    if (courses.isEmpty) {
      return const Center(child: Text("Aucun cours trouvé."));
    }

    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return GestureDetector(
          onTap: () {
            context.router.push(CourseDetailRoute(course: course));
          },
          child: CourseContinue(
            progress: 500,
            title: course.title,
            contentImage: course.thumbnail,
            name: 'John Doe',
            btnText: 'Join',
          ),
        );
      },
    );
  }

  
}
