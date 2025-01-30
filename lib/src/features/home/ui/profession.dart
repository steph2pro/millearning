import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/features/home/logic/profession_cubit.dart';
import 'package:millearnia/src/features/home/models/category.dart';
import 'package:millearnia/src/features/home/models/category_response.dart';
import 'package:millearnia/src/shared/components/home_components/categorie.dart';
import 'package:millearnia/src/shared/components/home_components/course_component.dart';

class Professions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfessionCubit()..getProfessions(),  // Initialisation du Cubit
      child: BlocBuilder<ProfessionCubit, ProfessionState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: Text("Bienvenue")),  // État initial, peut être un message de bienvenue
            loading: () => Center(child: CircularProgressIndicator()),  // Affichage pendant le chargement
            error: (error) => Center(child: Text("Erreur: erreur de connexion")),  // Affichage en cas d'erreur
            successGetProfessions: (response) {
              // Affichage des catégories lorsqu'elles sont récupérées avec succès
              return   Container(
                width: double.infinity,
                height: 300,
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: response.professions.length,
                    itemBuilder: (context, i) {
                      final profession = response.professions[i];
                      return GestureDetector(
                        onTap:() {
                          // context.router.push(professionDetailRoute());
                          },
                          child:  CourseComponent(
                            title: profession.name,
                            star: '4.8', 
                            contentImage: profession.thumbnail,
                              name: 
                              profession.user.name, 
                              prise:'180.00',
                              btnText:'Recommer'
                          ),
                      );
                    },
                  ),
              
              );
              //     Container(
              //   width: double.infinity,
              //   height: 120,
              //   child:ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: response.Professions?.length, 
              //       itemBuilder: (context, index) {
              //          Professions category = response.Professions![index];
              //         return Categorie(
              //           title: category.title,
              //           contentImage: category.icon,
              //         );
              //       },
              //     ),
              
              // );
                },
              );
        },
      ),
    );
  }
}

