import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/features/professions/logic/profession_userInterest_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:millearnia/src/shared/components/home_components/course_component.dart';
import 'package:millearnia/src/core/routing/app_router.dart';

class Professions extends StatefulWidget {
  const Professions({Key? key}) : super(key: key);

  @override
  _ProfessionsState createState() => _ProfessionsState();
}

class _ProfessionsState extends State<Professions> {
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
      context.read<ProfessionUserInterestCubit>().getProfessionUserInterests(userId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProfessionUserInterestCubit, ProfessionUserInterestState>(
        builder: (context, state) {
          return state.when(
            initial: () => buildSkeletonLoader(),
            loading: () => buildSkeletonLoader(),
            successGetProfessionUserInterest: (response) {
              return SizedBox(
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: response.professions.length,
                  itemBuilder: (context, i) {
                    final profession = response.professions[i];
                    return GestureDetector(
                      onTap: () {
                        context.router.push(ProfessionsDetailRoute(profession: profession));
                      },
                      child: CourseComponent(
                        title: profession.name,
                        star: '4.8',
                        contentImage: profession.thumbnail,
                        profilImage: profession.user.profil ?? '',
                        name: profession.user.name,
                        prise: '180.00',
                        btnText: 'Recommencer',
                      ),
                    );
                  },
                ),
              );
            },
            error: (error) => Center(child: Text('Erreur: $error')),
          );
        },
      ),
    );
  }

  Widget buildSkeletonLoader() {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 200,
              margin: const EdgeInsets.symmetric(horizontal: 8),
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
