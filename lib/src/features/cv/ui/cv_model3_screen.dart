import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/features/cv/logic/fetch_methodes.dart';
import 'package:millearnia/src/features/cv/models/activite.dart';
import 'package:millearnia/src/features/cv/models/certificat.dart';
import 'package:millearnia/src/features/cv/models/competences.dart';
import 'package:millearnia/src/features/cv/models/experience.dart';
import 'package:millearnia/src/features/cv/models/formation.dart';
import 'package:millearnia/src/features/cv/models/langues.dart';
import 'package:millearnia/src/features/cv/models/loisir.dart';
import 'package:millearnia/src/features/cv/models/qualites.dart';
import 'package:millearnia/src/features/cv/models/realisations.dart';
import 'package:millearnia/src/features/cv/models/references.dart';
import 'package:millearnia/src/features/cv/models/stage.dart';
import 'package:millearnia/src/shared/components/forme/niveau_indicateur.dart';
import 'package:millearnia/src/shared/components/forme/parallelograme.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class CvModel3Screen extends StatefulWidget {
  const CvModel3Screen({super.key});

  @override
  State<CvModel3Screen> createState() => _CvModel3ScreenState();
}

class _CvModel3ScreenState extends State<CvModel3Screen> {
  String nomComplet = '';
  String titre = '';
  String email = '';
  String telephone = '';
  String address = '';
  String ville = '';
  String lieuDeNaissance = '';
  String permisDeConduire = '';
  String sexe = '';
  String nationalite = '';
  String etatCivil = '';
  String siteInternet = '';
  String linkedin = '';
  String champPersonnalise = '';

   Uint8List? _profileImageBytes;
  String profil ='';
   List<Formation>formations =[];
   List<Experience>experiences =[];
   List<Stage>stages =[];
   List<Activite>activites =[];
   List<Certificats>certificats =[];
   List<Competences>competences =[];
   List<Langues>langues =[];
   List<References>references =[];
   List<Realisations>realisations =[];
   List<Qualites>qualites =[];
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
  lieuDeNaissance = prefs.getString('Lieu de naissance') ?? '';
  permisDeConduire = prefs.getString('Permis de conduire') ?? '';
  sexe = prefs.getString('Sexe') ?? '';
  nationalite = prefs.getString('nationalite') ?? '';
  etatCivil = prefs.getString('Etat civil') ?? '';
  siteInternet = prefs.getString('Site internet') ?? '';
  linkedin = prefs.getString('linkedin') ?? '';
  champPersonnalise = prefs.getString('Champ personalise') ?? '';
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
Future<void> loadActivites() async {
  activites = await fetchActivite();
}

Future<void> loadCertificatss() async {
  certificats = await fetchCertificats();
}


Future<void> loadCompetences() async {
  competences = await fetchCompetences();
}

Future<void> loadLangues() async {
  langues = await fetchLangues();
}

Future<void> loadReferences() async {
  references = await fetchReferences();
}

Future<void> loadRealisations() async {
  realisations = await fetchRealisations();
}
Future<void> loadQualites() async {
  qualites = await fetchQualites();
  print(qualites);
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
    loadActivites();
    loadCertificatss();
    loadCompetences();
    loadLangues();
    loadReferences();
    loadRealisations();
    loadQualites();
    loadLoisir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(                      
      appBar: AppBar(                      
        title: Text(                       
         'CV de $nomComplet',
          style: context.textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: context.colorScheme.onPrimary,
      ),
      
        // backgroundColor: context.colorScheme.scrim,
      body: 
      ListView(
        // padding: EdgeInsets.all(Dimens.spacing),
        children:[

          Column(
            children: [
              // Header Section
              Container(
                color: context.colorScheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Row(
                  children: [
                    // Profile Image
                   Container(
                    width: 108, // 100 (diamètre de l'avatar) + 4*2 (épaisseur de la bordure des deux côtés)
                    height: 108,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: context.colorScheme.onPrimary, // Couleur de la bordure
                        width: 4, // Épaisseur de la bordure
                      ),
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

                    const SizedBox(width: 15),
                    Expanded(
                      child: 
                    // Name and Title
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                        Text(
                          nomComplet, 
                          style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.onPrimary)
                        ),
                        Text(
                          titre,
                           style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.onPrimary),
                           
                        ),
                      ],
                    ),
                    ),
                  ],
                ),
              ),

              // Main Content Section
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column
                    Expanded(
                      flex: 1,
                      child:Container(
                        padding: const EdgeInsets.only(top: 10,left: 10),
                        color: context.colorScheme.surface,
                        child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Personal Information
                          sectionTitle('INFORMATIONS PERSONNELLES'),
                          
                          contactRow(Icons.person, nomComplet),
                          contactRow(Icons.email, email),
                          contactRow(Icons.phone, telephone),
                          contactRow(Icons.home, '$ville ,$address'),
                          if(lieuDeNaissance !='')
                          contactRow(Icons.date_range, lieuDeNaissance),

                          // Skills
                          sectionTitle('COMPETENCES'),
                          ...competences.map((competence){
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              infoText(competence.competence),
                              NiveauIndicateur(level: competence.niveau),
                              gapH6,
                                ],
                              );
                          }).toList(),
                          

                          // Languages
                          sectionTitle('LANGUAGES'),
                           ...langues.map((langue){
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              infoText(langue.langue),
                              NiveauIndicateur(level: langue.niveau),
                              gapH6,
                                ],
                              );
                          }).toList(),
                          

                          // Interests
                        if(loisirs.isNotEmpty)...[
                          sectionTitle('CENTRE D\'INTERET'),
                          ...loisirs.map((loisir){
                            return contactRow(
                              Icons.square,
                              loisir.loisir
                              );
                          }).toList(), 
                        ],

                          if(qualites.isNotEmpty)...[
                            sectionTitle('QUALITES'),
                            ...qualites.map((qualite){
                              return contactRow(
                                Icons.check,
                                qualite.qualite
                                );
                            }).toList(),
                          ],
                          if(references.isNotEmpty)...[
                           sectionTitle('REFERENCES'),
                           ...references.map((reference){
                            return ReferenceItem(
                              reference.nom, 
                              reference.entreprise, 
                              reference.ville,
                               reference.telephone, 
                               reference.email
                               );
                           }).toList(), 
                          ],
                           
                          
                        ],
                      ),
                      )
                    ),

                    const SizedBox(width: 20),

                    // Right Column
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        color: context.colorScheme.onPrimary,
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Profile
                          sectionTitle('PROFIL'),
                           Text(
                           profil,
                            style: context.textTheme.labelLarge,
                            textAlign: TextAlign.justify
                          ),
                          // Education
                          sectionTitle('FORMATIONS'),
                          ...formations.map((formation) {
                            return ContentItem(
                              formation.titre,
                              formation.etablissement,
                              formation.ville,
                              formation.dateDebut,
                              formation.dateFin,
                              formation.description,
                            );
                          }).toList(),

                          // Professional Experience
                          sectionTitle('EXPERIENCE PROFESSIONELLES'),
                          ...experiences.map((experience) {
                            return ContentItem(
                              experience.poste,
                              experience.employeur,
                              experience.ville,
                              experience.dateDebut,
                              experience.dateFin,
                              experience.description,
                            );
                          }).toList(),
                          // Internships
                          sectionTitle('STAGES'),
                          ...stages.map((stage) {
                            return ContentItem(
                              stage.poste,
                              stage.employeur,
                              stage.ville,
                              stage.dateDebut,
                              stage.dateFin,
                              stage.description,
                            );
                          }).toList(),
                          // Certificates
                          if(certificats.isNotEmpty)...[
                            sectionTitle('CERTIFICATS'),
                            ...certificats.map((certificat){
                              return CertifItem(
                                certificat.certificat, 
                                certificat.periode, 
                                certificat.description
                                );
                            }).toList(),
                          ],
                          
                          // Extracurricular Activities
                        if(activites.isNotEmpty)...[
                          sectionTitle('ACTIVITES EXTRA-SCOLAIRE'),
                          ...activites.map((activite) {
                            return ContentItem(
                              activite.poste,
                              activite.employeur,
                              activite.ville,
                              activite.dateDebut,
                              activite.dateFin,
                              activite.description,
                            );
                          }).toList(), 
                        ],

                          
                          if(realisations.isNotEmpty)...[
                            sectionTitle('REALISATIONS'),
                            ...realisations.map((realisation){
                              return contactRow(
                                Icons.check,
                                realisation.realisation
                                );
                            }).toList(),
                          ],
                        ],
                      ),
                      )
                    ),
                  ],
                ),
            ],
          ),







        ]
      ));
  }
  // Widget for Section Titles
  Widget sectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH18,
        Text(
        title,
        style: context.textTheme.titleSmall?.copyWith(color: context.colorScheme.primary,fontWeight: FontWeight.w700)
        ),
        gapH4,
        Divider(color: context.colorScheme.secondaryContainer,),
        gapH10
    ]);
  }
   Widget contactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, color:context.colorScheme.primary,size: 20,),
          gapW10,
          Flexible(
            child: Text(text, style: context.textTheme.labelLarge),
          )
        ],
      ),
    );
  }
   Widget ContentItem(String poste ,String employeur,String ville,String debut,String fin,String description){
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${poste.toUpperCase()}  \n",
                      style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)
                    ),
                    TextSpan(
                      text: "$employeur, $ville | ",
                      style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600,color:context.colorScheme.primary),
                    ),
                    TextSpan(
                      text: '$debut - $fin',
                      style: context.textTheme.labelLarge?.copyWith(color:context.colorScheme.primary),
                    ),
                  ],
                ),
              ),
              gapH6,
              Text(
                description,
                style: context.textTheme.labelLarge,
                textAlign: TextAlign.justify,
              ),
              gapH6,
        ],
    );
  }
 Widget CertifItem(String certificat ,String periode,String description){
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${certificat.toUpperCase()}  | ",
                      style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)
                    ),
                    TextSpan(
                      text: periode,
                      style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600,color:context.colorScheme.primary),
                    ),
                   
                  ],
                ),
              ),
              gapH6,
              Text(
                description,
                style: context.textTheme.labelLarge,
                textAlign: TextAlign.justify,
              ),
              gapH6,
        ],
    );
  } 
  Widget ReferenceItem(String Nom ,String Entreprise,String Ville,String Numero,String Adresse,){
    return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check,color:context.colorScheme.primary,size: 20,),
              gapW6,
              Flexible(child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${Nom.toUpperCase()}  \n",
                      style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)
                    ),
                    TextSpan(
                      text: "$Entreprise, $Ville \n",
                      style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600,color:context.colorScheme.primary),
                    ),
                    TextSpan(
                      text: '$Numero \n $Adresse',
                      style: context.textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              ),
              gapH6,
        ],
    );
  }
  // Widget for Information Text
  Widget infoText(String text) {
    return Padding( 
      padding: const EdgeInsets.only(bottom:5),
      child:Text(
        text,style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),   
      ),
    );
  }
}