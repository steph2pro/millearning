import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/shared/components/forme/parallelograme.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

@RoutePage()
class CvModel2Screen extends StatefulWidget {
  const CvModel2Screen({super.key});

  @override
  State<CvModel2Screen> createState() => _CvModel2ScreenState();
}

class _CvModel2ScreenState extends State<CvModel2Screen> {
  

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
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage('assets/images/profile2.png'), // Remplacez par votre image
                            ),
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
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris luctus lobortis diam.",
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
                          contactRow(Icons.phone, "123 456 789"),
                          contactRow(Icons.email, "email@exemple.com"),
                          contactRow(Icons.web, "www.job.com"),
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
                              socialLink("Facebook"),
                              socialLink("LinkedIn"),
                              socialLink("Twitter"),
                              socialLink("Instagram"),
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
                             Flexible(
                              child: Text(
                                "ADÉLAÏDE SAINDON",
                                style: context.textTheme.titleLarge
                              )
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
                           experienceItem(
                                  "Titre de poste",
                                  "Nom de la compagnie",
                                  "2013",
                                  '2015',
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                ),

                           
                            experienceItem(
                              "Titre de poste",
                              "Nom de la compagnie",
                              "2015 ",
                              '2018',
                              "Mauris luctus lobortis diam.",
                            ),
                            traitNoir(),  
                             Text(
                              "FORMATIONS",
                              style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)
                            ), 
                            traitNoir(),
                            const SizedBox(height: 10),
                            formationItem(
                              'titre',
                              "Université",
                              'Douala',
                              "2013",
                              '2015',
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                            ),
                            formationItem(
                              'titre',
                              "Université",
                              'Douala',
                              "2013",
                              '2015',
                              "Certificat de formation."
                            ),
                            const SizedBox(height: 20),
                           
                           traitNoir(),
                             Text(
                              "STAGES",
                              style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)
                            ),
                           traitNoir(),
                           experienceItem(
                                  "Poste",
                                  "Emplyeur",
                                  "2013",
                                  '2015',
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                ),

                           
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
              gapH6,
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