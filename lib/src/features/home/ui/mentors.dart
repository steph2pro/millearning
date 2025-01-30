import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millearnia/src/datasource/models/user_model.dart';
import 'package:millearnia/src/features/home/logic/category_cubit.dart';
import 'package:millearnia/src/features/home/logic/mentor_cubit.dart';
import 'package:millearnia/src/features/home/models/category.dart';
import 'package:millearnia/src/features/home/models/category_response.dart';
import 'package:millearnia/src/shared/components/home_components/categorie.dart';

class Mentors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MentorCubit()..getMentors(),  // Initialisation du Cubit
      child: BlocBuilder<MentorCubit, MentorState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: Text("Bienvenue")),  // État initial, peut être un message de bienvenue
            loading: () => Center(child: CircularProgressIndicator()),  // Affichage pendant le chargement
            error: (error) => Center(child: Text("Erreur: erreur de connexion **")),  // Affichage en cas d'erreur
            successGetMentors: (response) {
              // Affichage des catégories lorsqu'elles sont récupérées avec succès
              return   Container(
                width: double.infinity,
                height: 130,
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: response.mentors.length,
                    itemBuilder: (context, index) {
                      UserModel mentor = response.mentors[index];
                      return Categorie(
                        title: mentor.name,
                        contentImage: mentor.profil!,
                      );
                    },
                  ),
              
              );
              //     Container(
              //   width: double.infinity,
              //   height: 120,
              //   child:ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: response.Mentors?.length, 
              //       itemBuilder: (context, index) {
              //          Mentor Mentor = response.Mentors![index];
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
