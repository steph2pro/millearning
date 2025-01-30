import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/features/home/logic/category_cubit.dart';
import 'package:millearnia/src/features/home/models/category.dart';
import 'package:millearnia/src/features/home/models/category_response.dart';
import 'package:millearnia/src/shared/components/home_components/categorie.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getCategories(),  // Initialisation du Cubit
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: Text("Bienvenue")),  // État initial, peut être un message de bienvenue
            loading: () => Center(child: CircularProgressIndicator()),  // Affichage pendant le chargement
            error: (error) => Center(child: Text("Erreur: erreur de connexion")),  // Affichage en cas d'erreur
            successGetCategories: (response) {
              // Affichage des catégories lorsqu'elles sont récupérées avec succès
              return  
                  Container(
                width: double.infinity,
                height: 120,
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: response.categories?.length, 
                    itemBuilder: (context, index) {
                       Category category = response.categories![index];
                      return Categorie(
                        title: category.title,
                        contentImage: category.icon,
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
