import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';
import 'package:millearnia/src/features/home/logic/mentor_cubit.dart';
import 'package:millearnia/src/shared/components/home_components/categorie.dart';

class Mentors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MentorCubit()..getMentors(), // Initialisation du Cubit
      child: BlocBuilder<MentorCubit, MentorState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text("Bienvenue")), // État initial
            loading: () => buildSkeletonLoader(), // 🔥 Utilisation du Skeleton Loader
            error: (error) => const Center(child: Text("Erreur: erreur de connexion **")), // Gestion d'erreur
            successGetMentors: (response) {
              return Container(
                width: double.infinity,
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: response.mentors.length,
                  itemBuilder: (context, index) {
                    UserModel mentor = response.mentors[index];
                    return Categorie(
                      title: mentor.name,
                      contentImage: mentor.profil ?? '', // Vérification null-safe
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

  /// **🔥 Skeleton Loader pour les mentors**
  Widget buildSkeletonLoader() {
    return Container(
      width: double.infinity,
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Simule 5 mentors en chargement
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 100,
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
