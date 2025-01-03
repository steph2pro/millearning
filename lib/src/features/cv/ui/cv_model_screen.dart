import 'dart:convert';
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
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class CvModelScreen extends StatefulWidget {
  const CvModelScreen({super.key});

  @override
  State<CvModelScreen> createState() => _CvModelScreenState();
}

class _CvModelScreenState extends State<CvModelScreen> {
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
          'model 1',
          style: context.textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: context.colorScheme.onPrimary,
      ),
      
        backgroundColor: context.colorScheme.scrim,
      body: ListView(
        // padding: EdgeInsets.all(Dimens.spacing),
        children:[
          
            Container(
              color: context.colorScheme.surface,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 
                  // Informations principales
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          nomComplet,
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.onSurface),
                        ),
                        gapH6,
                        Text(
                          titre,
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.error),
                        ),
                       

                ]),
                  ),
                  gapW20,
                   // Image de profil
                   Container(
                    width: 108, 
                    height: 108,
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
                              width: 100,
                              height: 100,
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
                  //   radius: 70,
                  //   backgroundImage: AssetImage('assets/images/profile4.png'),
                  // ),
                ],
              ),
               gapH6,
                        Text(
                          profil,
                          style: context.textTheme.labelLarge,
                          textAlign: TextAlign.justify,
                        ),
        ]),
            ),

            // Content Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section principale (Expériences & Formation)
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    color: context.colorScheme.onPrimary,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Expériences
                        Text(
                          'EXPÉRIENCES PROFESSIONNELLES',
                          style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.error),
                        ),
                        gapH6,
                        ...experiences.map((experience) {
                            return _buildExperienceItem(
                              context,
                             experience.poste,
                              experience.employeur,
                              experience.ville,
                               experience.dateDebut,
                              experience.dateFin, 
                               experience.description
                            );
                          }).toList(),
                          gapH12,

                        // Formation
                        Text(
                          'FORMATION',
                          style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.error),
                        ),
                        gapH6,
                        ...formations.map((formation){
                            return _buildEducationItem(
                              context,
                              formation.titre,
                               formation.etablissement,
                                formation.dateDebut,
                               formation.dateFin
                            );
                        }).toList(),
                        Text(
                          'STAGES',
                          style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.error),
                        ),
                        gapH6,
                        ...stages.map((stage) {
                            return _buildExperienceItem(
                              context,
                             stage.poste,
                              stage.employeur,
                              stage.ville,
                               stage.dateDebut,
                              stage.dateFin, 
                               stage.description
                            );
                          }).toList(),

                      ],
                    ),
                  ),
                ),

                // Barre latérale (Contact & Compétences)
                Container(
                  width: 170,
                  // height: double.maxFinite,
                  color: context.colorScheme.scrim,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Contact
                      Text(
                        'CONTACT',
                          style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.onPrimary),
                        
                      ),
                      gapH12,
                      Row(
                        children: [
                          Icon(Icons.phone,color: context.colorScheme.onPrimary,size: 20,),
                          gapW10,
                          Flexible(child: 
                          Text(
                            telephone,
                            style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary),
                          )
                          )
                        ],
                      ),
                      gapH6,
                      Row(
                      children: [
                        Icon(Icons.email, color: context.colorScheme.onPrimary, size: 20),
                        gapW10,
                         Flexible(
                          child:Text(
                            email,
                            style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary),
                            overflow: TextOverflow.visible, // (Facultatif) Permet d'assurer que le texte s'affiche complètement
                          ),
                       ),
                      ],
                    ), 
                      gapH6,
                      Row(
                        children: [
                          Icon(Icons.home,color: context.colorScheme.onPrimary, size: 20),
                          gapW10,
                         Flexible(
                          child: Text(
                            '$address, $ville',
                            style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary),
                          )
                       ),
                        ],
                      ),
                      gapH18,
                      // Langues
                      Text(
                        'LANGUES',
                          style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.onPrimary),
                        
                      ),
                      gapH12,
                      ...langues.map((langue){
                          return  Text(
                            '${langue.langue}: ${langue.niveau}',
                            style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary),
                          );
                      }).toList(),
                     
                      gapH18,
                      // Compétences
                      Text(
                        'COMPÉTENCES',
                        style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.onPrimary),
                        ),
                      gapH12,
                      ...competences.map((competence){
                          return competenceItem(context, competence.competence);
                      }).toList(),
                      gapH18,
                     
                      // Loisirs
                      Text(
                        'LOISIRS',
                          style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.onPrimary),
                        ),
                      gapH12,
                      
                      ...loisirs.map((loisir){
                          return Text(
                            loisir.loisir,
                            style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary),
                          );
                      }).toList(),
                      
                      
                    ],
                  ),
                  ),
              ],
            ),

            // Bouton de téléchargement PDF
           SizedBox(
            width: 140,
            child:  FloatingActionButton(
              onPressed: () => _generatePdf(context),
              child: Icon(Icons.download), // Icône de téléchargement
              tooltip: 'Télécharger le CV en PDF', // Info-bulle
            ),
           )

          ],
        ),
        
        
    );
  }
}
Widget competenceItem(BuildContext context,String competence){
  return  Row(
                      children: [
                        Icon(Icons.check, color: context.colorScheme.onPrimary, size: 20),
                        gapW10,
                         Flexible(
                          child:Text(
                           competence,
                            style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary),
                            overflow: TextOverflow.visible, // (Facultatif) Permet d'assurer que le texte s'affiche complètement
                          ),
                       ),
                      ],
                    );
}

Widget _buildExperienceItem(BuildContext context,String Poste, String Employeur, String Ville, String debut,String fin,String Description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Poste, 
            style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onSurface,fontWeight: FontWeight.w600),
          ),
          Text(
            '$Employeur ,$Ville', 
            style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onSecondaryContainer,fontWeight: FontWeight.w600),
           
          ),
          Text(
            '$debut - $fin', 
            style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onTertiaryContainer,fontWeight: FontWeight.w600),
            
          ),
          
          Text(
            Description, 
            style: context.textTheme.labelLarge,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _buildEducationItem(BuildContext context,String titre, String etablissement, String debut,String fin,) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titre, 
            style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onSurface,fontWeight: FontWeight.w600),
          ),
          Text(
            '$etablissement | $debut - $fin', 
            style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onSecondaryContainer,fontWeight: FontWeight.w600),
           
          ),
          
        ],
      ),
    );
  }

  void _generatePdf(BuildContext context) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Center(
          child: pw.Text('CV PDF généré'),
        ),
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }


