import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/features/course/logic/course_userInterest_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/datasource/models/course.dart';
import 'package:millearnia/src/features/home/logic/course_cubit.dart';
import 'package:millearnia/src/shared/components/home_components/course_continue.dart';

class CourseList extends StatefulWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  
  int? userId;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('id');
      isLoading = false;
    });

    if (userId != null) {
      context.read<CourseUserInterestCubit>().getCourseUserInterests(userId!);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Expanded( // Initialisation du Cubit
      child: BlocBuilder<CourseUserInterestCubit, CourseUserInterestState>(
        builder: (context, state) {
          return state.when(
            initial: () => buildSkeletonLoader(context), // État initial
            loading: () => buildSkeletonLoader(context), // 🔥 Skeleton au lieu du CircularProgressIndicator
            error: (error) => const Center(child: Text("Erreur: erreur de connexion **")), // Affichage en cas d'erreur
            successGetCourseUserInterests: (response) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.7, // Limite la hauteur
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: response.courses.length,
                  itemBuilder: (context, index) {
                    Course course = response.courses[index];
                    return GestureDetector(
                      onTap: () {
                        context.router.push(CourseDetailRoute(course: course));
                      },
                      child: CourseContinue(
                        title: course.title,
                        contentImage: course.thumbnail,
                        profilImage: course.user.profil,
                        name: course.user.name,
                        btnText: 'Design',
                        progress: 20,
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  /// 🔥 **Skeleton Loader pour les cours**
  Widget buildSkeletonLoader(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5, // Simule 5 éléments en chargement
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        },
      ),
    );
  }
}
