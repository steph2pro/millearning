import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/features/home/logic/course_cubit.dart';
import 'package:millearnia/src/shared/components/courses/menu.dart';
import 'package:millearnia/src/shared/components/home_components/course_continue.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

@RoutePage()
class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<CourseCubit>().getCourses(); // Charger les courses
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
            Expanded(child: _pages[_currentIndex]),
          ],
        ),
      ),
    );
  }

  /// Liste des pages (cours en cours et terminés)
  final List<Widget> _pages = [
    _OngoingCourses(), // Liste des cours en cours
    const Center(child: Text("Courses Completed")), // Placeholder pour les cours terminés
  ];
}

/// Widget séparé pour afficher les cours en cours
class _OngoingCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          successGetCourses: (response) {
            return _buildCourseList(response.courses);
          },
          error: (error) => Center(child: Text('Erreur: $error')),
        );
      },
    );
  }

  /// Construction de la liste des cours
  static Widget _buildCourseList(List courses) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return CourseContinue(
          progress: 50,
          title: course.title,
          contentImage: course.thumbnail,
          name: 'djon doe',
          // course.user.name,
          btnText: 'Join',
        );
      },
    );
  }
}
