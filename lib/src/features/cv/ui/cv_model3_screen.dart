import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/shared/components/forme/niveau_indicateur.dart';
import 'package:millearnia/src/shared/components/forme/parallelograme.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

@RoutePage()
class CvModel3Screen extends StatefulWidget {
  const CvModel3Screen({super.key});

  @override
  State<CvModel3Screen> createState() => _CvModel3ScreenState();
}

class _CvModel3ScreenState extends State<CvModel3Screen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(                      
      appBar: AppBar(                      
        title: Text(                       
         'model 3',
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
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/profile1.png'), // Remplacez par votre image
                    ),
                  ),

                    const SizedBox(width: 15),
                    // Name and Title
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          'stephane ch kamga2', 
                          style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.onPrimary)
                        ),
                        Text(
                          'dev mobile',
                           style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.onPrimary),
                           textAlign: TextAlign.center,
                        ),
                      ],
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
                          
                          contactRow(Icons.person, "stephane ch kamga2"),
                          contactRow(Icons.email, "email@exemple.com"),
                          contactRow(Icons.phone, '677778893'),
                          contactRow(Icons.home, "Douala, Bafoussam"),
                          contactRow(Icons.date_range, "22 février 2002"),

                          // Skills
                          sectionTitle('COMPETENCES'),
                          Column(
                            children: [
                          infoText('Développement web'),
                          NiveauIndicateur(level: 'Débutant'),
                          gapH6,
                          infoText('Gestion de projet'),
                          NiveauIndicateur(level: 'Très Bien')

                            ],
                          ),

                          // Languages
                          sectionTitle('LANGUAGES'),
                          infoText('Français'),
                          NiveauIndicateur(level: 'Débutant'),
                          gapH6,
                          infoText('Anglais'),
                          NiveauIndicateur(level: 'Très Bien'),
                          gapH6,
                          

                          // Interests
                          sectionTitle('CENTRE D\'INTERET'),
                          contactRow(Icons.square,"lecture"),
                          contactRow(Icons.square,"Sport"),

                           sectionTitle('QUALITES'),
                          contactRow(Icons.square,"Ponctualite"),
                          contactRow(Icons.square,"Taffeur"),

                           sectionTitle('REFERENCES'),
                           ReferenceItem("Mentor", "StephCoop", "Bandjoun", "+237 671 50 62 17", "steph.contact@gmail.com"),
                          
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
                            'Fort d\'une solide compréhension technique et pratique, je m\'efforce d\'apporter une perspective unique et innovante à tout projet auquel je participe.',
                            style: context.textTheme.labelLarge,
                            textAlign: TextAlign.justify
                          ),
                          // Education
                          sectionTitle('FORMATIONS'),
                          ContentItem('Développement mobile', ' Insam', 'Bafoussam','mai 2021' ,'juil. 2022','description'),
                          ContentItem('Développement web', 'Digital Solution', 'Bafoussam', 'juin 2019',  'juil. 2022','description'),
                          

                          // Professional Experience
                          sectionTitle('EXPERIENCE PROFESSIONELLES'),
                          ContentItem('Développement web', 'Digital Solution', 'bandjoun', 'juin 2019',  'juil. 2022','description'),
                          ContentItem('Développement web', 'Digital Solution', 'bandjoun', 'juin 2019',  'juil. 2022','description'),

                          // Internships
                          sectionTitle('STAGES'),
                          ContentItem('Programmation web', 'Digital Solution', 'bandjoun', 'juin 2019',  'juil. 2022','description'),
                          ContentItem('Programmation web', 'Digital Solution', 'bandjoun', 'juin 2019',  'juil. 2022','description'),

                          // Certificates
                          sectionTitle('CERTIFICATS'),
                          CertifItem('certificat', 'periode', 'description'),
                          CertifItem('certificat', 'periode', 'description'),
                          // Extracurricular Activities
                          sectionTitle('ACTIVITES EXTRA-SCOLAIRE'),
                           ContentItem('Formateur web', 'StephCoop', 'bandjoun', 'juin 2019',  'juil. 2022','description'),
                           ContentItem('Formateur web', 'StephCoop', 'bandjoun', 'juin 2019',  'juil. 2022','description'),

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
                      style: context.textTheme.labelLarge?.copyWith(color:context.colorScheme.primary),
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