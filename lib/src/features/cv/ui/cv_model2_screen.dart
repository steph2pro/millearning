import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/features/cv/logic/fetch_methodes.dart';
import 'package:millearnia/src/features/cv/models/competences.dart';
import 'package:millearnia/src/features/cv/models/experience.dart';
import 'package:millearnia/src/features/cv/models/formation.dart';
import 'package:millearnia/src/features/cv/models/langues.dart';
import 'package:millearnia/src/features/cv/models/loisir.dart';
import 'package:millearnia/src/features/cv/models/stage.dart';
import 'package:millearnia/src/shared/components/forme/parallelograme.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class CvModel2Screen extends StatefulWidget {
  const CvModel2Screen({super.key});

  @override
  State<CvModel2Screen> createState() => _CvModel2ScreenState();
}

class _CvModel2ScreenState extends State<CvModel2Screen> {
  String nomComplet = '';
  String titre = '';
  String email = '';
  String telephone = '';
  String address = '';
  String ville = '';

   Uint8List? _profileImageBytes;
  String profil ='';
   List<Formation>formations =[];
   List<Experience>experiences =[];
   List<Stage>stages =[];
   List<Competences>competences =[];
   List<Langues>langues =[];
   List<Loisir>loisirs =[];


  Future<void> _loadImageFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final imageBase64 = prefs.getString('profileImage');
    if (imageBase64 != null) {
      setState(() {
        _profileImageBytes = base64Decode(imageBase64);
      });
    }
  }
  Future<void> fetchInfosPersonels() async {
  final prefs = await SharedPreferences.getInstance();

  nomComplet = prefs.getString('Nom complet') ?? '';
  titre = prefs.getString('titre') ?? '';
  email = prefs.getString('email') ?? '';
  telephone = prefs.getString('telephone') ?? '';
  address = prefs.getString('address') ?? '';
  ville = prefs.getString('ville') ?? '';
}
Future<void> fetchProfil() async {
  final prefs = await SharedPreferences.getInstance();

  profil = prefs.getString('profileDescription') ?? '';
}

Future<void> loadFormations() async {
  formations = await fetchFormation();
}
Future<void> loadExperiences() async {
  experiences = await fetchExperience();
}

Future<void> loadStages() async {
  stages = await fetchStage();
}
Future<void> loadCompetences() async {
  competences = await fetchCompetences();
}

Future<void> loadLangues() async {
  langues = await fetchLangues();
}

Future<void> loadLoisir() async {
  loisirs = await fetchLoisir();
}
  @override
  void initState() {
    super.initState();
    _loadImageFromSharedPreferences();
    fetchInfosPersonels();
    fetchProfil();
    loadFormations();
    loadExperiences();
    loadStages();
    loadCompetences();
    loadLangues();
    loadLoisir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'model 2',
          style: context.textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: context.colorScheme.onPrimary,
      ),
      
        backgroundColor: context.colorScheme.scrim,
      body: 
      ListView(
        // padding: EdgeInsets.all(Dimens.spacing),
        children:[
         Column(
              children: [
                // Colonne principale avec deux sections : Gauche et Droite
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section gauche (Profil et Contact)
                    Container(
                      width: 170, // 40% de la largeur
                      color: context.colorScheme.scrim,
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Photo de profil
                          Center(
                            child: Container(
                    width: 118, 
                    height: 118,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // border: Border.all(
                      //   color: context.colorScheme.onPrimary, // Couleur de la bordure
                      //   width: 4, // Épaisseur de la bordure
                      // ),
                    ),
                    child: ClipOval(
                      child: _profileImageBytes != null
                          ? Image.memory(
                              _profileImageBytes!,
                              fit: BoxFit.cover, // L'image occupe entièrement le conteneur
                              // width: 100,
                              // height: 100,
                            )
                          : Container(
                              color: context.colorScheme.onPrimary,
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: context.colorScheme.tertiary,
                              ),
                            ),
                    ),
                  ),
                            // CircleAvatar(
                            //   radius: 60,
                            //   backgroundImage: AssetImage('assets/images/profile2.png'), // Remplacez par votre image
                            // ),
                          ),
                          gapH20,
                          trait(),
                          // Profil
                           Text(
                            "PROFIL",
                            textAlign: TextAlign.center,
                          style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.onPrimary),
                          ),
                          gapH10,
                          trait(),

                          gapH8,
                           Text(
                            profil,
                            style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary),
                            textAlign: TextAlign.justify,
                            ),
                         gapH18,
                          trait(),
                           Text(
                            "CONTACT",
                          style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.onPrimary),
                          ),
                          trait(),
                          gapH10,
                          contactRow(Icons.phone, telephone),
                          contactRow(Icons.email, email),
                          contactRow(Icons.home, "$address, $ville"),
                          gapH20,
                           trait(),
                           Text(
                            "Loisirs",
                          style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.onPrimary),
                          ),
                          trait(),
                          Row(
                            children: [
                                 Parallelograme(
                                  width: 25,
                                  height: 100,
                                  startColor: Colors.yellow.shade700,
                                  endColor: Colors.yellow,
                                ),
                             gapW10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              gapH20,
                              ...loisirs.map((loisir){
                                return socialLink(loisir.loisir);
                              }).toList(),
                            ],
                          ),

                            ],
                          ),
                         
                        ],
                      ),
                    ),
                    // Section droite (Expérience, Éducation et Intérêts)
                    Expanded(
                      child: Container(
                        color:context.colorScheme.onPrimary,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                            children: [ 
                              // Nom et prénom
                             Expanded(
                    child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Flexible(
                              // child:
                               Text(
                                nomComplet ,
                                style: context.textTheme.titleLarge
                              ),
                            // ),
                              gapH6,
                              Text(
                                titre,
                                textAlign: TextAlign.center,
                                style: context.textTheme.titleMedium
                                // ?.copyWith(color: context.colorScheme.error),
                              ),
                              ],
                             ),
                             ),
                                gapW10,
                                 Parallelograme(
                                  width: 25,
                                  height: 100,
                                  startColor: Colors.yellow.shade700,
                                  endColor: Colors.yellow,
                                ),
                             
                            
                           
                          ]),
                           gapH32,
                           traitNoir(),
                             Text(
                              "EXPÉRIENCE",
                              style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)
                            ),
                           traitNoir(),
                           ...experiences.map((experience){
                            return  experienceItem(
                                  experience.poste,
                                  experience.employeur,
                                  experience.dateDebut,
                                  experience.dateFin,
                                  experience.description
                                );
                           }).toList(),

                            traitNoir(),  
                             Text(
                              "FORMATIONS",
                              style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)
                            ), 
                            traitNoir(),
                            const SizedBox(height: 10),
                            
                           ...formations.map((formation){
                            return  formationItem(
                                  formation.titre,
                                  formation.etablissement,
                                  formation.ville,
                                  formation.dateDebut,
                                  formation.dateFin,
                                  formation.description
                                );
                           }).toList(),
                           gapH18,
                           
                           traitNoir(),
                             Text(
                              "STAGES",
                              style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)
                            ),
                           traitNoir(),
                           ...stages.map((stage){
                            return  experienceItem(
                                  stage.poste,
                                  stage.employeur,
                                  stage.dateDebut,
                                  stage.dateFin,
                                  stage.description,
                                );
                           }).toList(),
                           
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //      Container()
          ],
        ),
    );
  }

  Widget contactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, color:context.colorScheme.onPrimary,size: 20,),
          gapW10,
          Flexible(
            child: Text(text, style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary)),
          )
        ],
      ),
    );
  }

  Widget socialLink(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        "- $text",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

 Widget experienceItem(String poste, String employeur, String debut, String fin, String description) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Point(),
        SizedBox(width: 10), // gapW10 peut être remplacé par SizedBox si c'est juste un espace
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${poste.toUpperCase()}  ",
                      style: context.textTheme.labelLarge,
                    ),
                    TextSpan(
                      text: "$employeur ",
                      style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: '$debut - $fin',
                      style: context.textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              gapH2,
              Text(
                description,
                style: context.textTheme.labelLarge,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


  Widget formationItem(String title, String institution, String ville ,String debut, String fin, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                  Point(),
                  gapW10,
              Container(
                width: 90,
                child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                    institution,
                      style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
                  ) 
                  ), 

                ],
              ),
            Text(
               '$debut - $fin',
                style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
            ),   
            Text(
               ville,
                style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
            ) , 
            ],
          ),
              ),
         
          gapW4,
          Expanded(
            child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
            Text(
               title.toUpperCase(),
                style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
            ) ,
            Container(
              width:110,
              child: Text(
               description,
                style: context.textTheme.labelLarge,
                textAlign: TextAlign.justify,
            )   ,
            )
          //  Flexible(
            // child: 
           
          //  )
            ],
          ),
          
          )
        ],
      ),
    );
  }

  
  Widget trait(){
    return Container(
      height: 1,
      width: double.infinity, 
      margin: EdgeInsets.symmetric(vertical: 5), 
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary, 
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
  Widget traitNoir(){
    return Container(
      height: 1,
      width: double.infinity, 
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25), 
      decoration: BoxDecoration(
        color: context.colorScheme.scrim, 
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
  Widget Point(){
    return  Container(
      width: 10, // Taille du point (diamètre)
      height: 10, // Même taille que la largeur pour qu'il soit rond
      decoration: BoxDecoration(
        color: context.colorScheme.scrim, // Couleur du point
        shape: BoxShape.circle, // Forme circulaire
      ),
    );
  }
}