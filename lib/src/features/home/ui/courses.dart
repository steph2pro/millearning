import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/course.dart';
import 'package:millearnia/src/features/home/logic/course_cubit.dart';
import 'package:millearnia/src/shared/components/home_components/course_continue.dart';

class CourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseCubit()..getCourses(), // Initialisation du Cubit
      child: BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text("Bienvenue")), // État initial
            loading: () => const Center(child: CircularProgressIndicator()), // Affichage pendant le chargement
            error: (error) => const Center(child: Text("Erreur: erreur de connexion **")), // Affichage en cas d'erreur
            successGetCourses: (response) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.7, // Limite la hauteur
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: response.courses.length,
                  itemBuilder: (context, index) {
                    Course course = response.courses[index];
                    return CourseContinue(
                      title: course.title,
                      contentImage: course.thumbnail,
                      name: 'Jacob Jones',
                      btnText: 'Design',
                      progress: 20,
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
}
