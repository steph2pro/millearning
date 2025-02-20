import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:millearnia/src/features/home/logic/category_cubit.dart';
import 'package:millearnia/src/features/home/models/category.dart';
import 'package:millearnia/src/shared/components/home_components/categorie.dart';
import 'package:millearnia/src/core/routing/app_router.dart'; // Import AutoRoute
import 'package:millearnia/src/features/professions/ui/professions_screen.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getCategories(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text("Bienvenue")),
            loading: () => buildSkeletonLoader(), // 🔥 Utilisation du Skeleton Loader
            error: (error) => const Center(child: Text("Erreur: erreur de connexion")),
            successGetCategories: (response) {
              return Container(
                width: double.infinity,
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: response.categories?.length ?? 0,
                  itemBuilder: (context, index) {
                    Category category = response.categories![index];
                    return GestureDetector(
                      onTap: () {
                        context.router.push(ProfessionsRoute(categoryId: category.id));
                      },
                      child: Categorie(
                        title: category.title,
                        contentImage: category.icon,
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

  /// **🔥 Skeleton Loader pour les catégories**
  Widget buildSkeletonLoader() {
    return Container(
      width: double.infinity,
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Simule 5 éléments en chargement
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
