import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/datasource/models/api_response/api_response.dart';
import 'package:millearnia/src/datasource/models/course.dart';
import 'package:millearnia/src/features/course/logic/userCourse_enroll_cubit.dart';
import 'package:millearnia/src/features/course/models/userCourse_request.dart';
import 'package:millearnia/src/shared/components/courses/about_course.dart';
import 'package:millearnia/src/shared/components/courses/course_header.dart';
import 'package:millearnia/src/shared/components/courses/course_title.dart';
import 'package:millearnia/src/shared/components/courses/menu.dart';
import 'package:millearnia/src/shared/components/courses/prise.dart';
import 'package:millearnia/src/shared/components/dialogs/dialog_builder.dart';
import 'package:millearnia/src/shared/components/modals/modal.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';


@RoutePage()
class CourseDetailScreen extends StatefulWidget {
  final Course course;

  const CourseDetailScreen({super.key, required this.course});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int _currentIndex = 0;
  double progress = 0.0;

  // Simulation d'une progression de téléchargement
  void startDownload() {
    Future.delayed(const Duration(milliseconds: 500), () {
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

  int? userId;
  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id'); // Récupérer l'ID
    // Tu peux aussi récupérer le nom, l'email, etc.
    // String? name = prefs.getString('name');
    // String? email = prefs.getString('email');
    // String? phone = prefs.getString('phone');
    print('********* $userId ************');
    setState(() {}); // Rafraîchir l'interface pour que l'ID soit disponible
  }

  @override
  void initState() {
    super.initState();
    startDownload();
    getUserData(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      body:  BlocConsumer<UserCourseEnrollCubit, UserCourseEnrollState>(
        listener: (context, state) {
          state.whenOrNull(
          loading: () => LoadingDialog.show(context: context),
          successUserCourseEnroll: (response) {
            LoadingDialog.hide(context: context);
            showSuccesModal(response.message);
              // context.router.push(const HomePageRoute());
            

            print(response);
          },
          error: (error) {
                LoadingDialog.hide(context: context);
                showErrorModal(error.type == ApiErrorType.user ? error.error.response.data['message'].toString() : 'erreur de connexion');
            // _showErrorDialog(context, error.message!);
          },
        );
        },
        builder: (context, state) {
          return
      
      SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                // Header avec l'image du cours
                CourseHeader(
                  videoId: '',
                  thumbnailImage:widget.course.thumbnail, // Supposé être un ID vidéo YouTube
                  back: () {
                    context.router.maybePop();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // Titre et infos du cours
                      CourseTitle(
                        title: widget.course.title,
                        reviews: 356,
                        start: 4.6,
                        name: widget.course.user.name, // Peut être ajouté à `Course`
                        lessons: widget.course.duration,
                        certification: 0,
                      ),
                      gapH20,
                      // Menu pour naviguer entre sections
                      Menu(
                        items: ['About', 'Lessons', 'Reviews'],
                        onItemSelected: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      gapH20,
                      // Sections dynamiques
                      _buildPageContent(_currentIndex),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
        
    }),
      bottomNavigationBar: BottomAppBar(
        child: PriceAndEnrollButton(totalPrice: 180.00,
        onPressed: (){
                          final userCourse = UserCourseRequest(
                            userId: userId!, // Remplacez ceci par l'ID de l'utilisateur
                            courseId: widget.course.id,
                          );

                          context.read<UserCourseEnrollCubit>().inscriptionCours(userCourse);
        },), // À adapter si nécessaire
      )
    );
      
  }

  Widget _buildPageContent(int index) {
    switch (index) {
      case 0:
        return AboutCourseSection(
          description: widget.course.description,
          tutorName: widget.course.user.name,
          tutorRole:widget.course.user.role,
          tutorImageUrl: widget.course.user.profil, // Peut être une image du tuteur
          info: {
            "Students": "156,213",
            "Language": "English",
            "Last update": "Feb 2, 2023",
            "Level": "Beginner",
            "Access": "Mobile, Desktop",
          },
        );
      case 1:
        return Center(child: Text("Lessons Content for ${widget.course.title}"));
      case 2:
        return Center(child: Text("Reviews Content for ${widget.course.title}"));
      default:
        return Container();
    }
  }
}
