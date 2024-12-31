import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

@RoutePage()
class CvModelScreen extends StatefulWidget {
  const CvModelScreen({super.key});

  @override
  State<CvModelScreen> createState() => _CvModelScreenState();
}

class _CvModelScreenState extends State<CvModelScreen> {
  

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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  // Informations principales
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Prénom NOM ',
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.onSurface),
                        ),
                        gapH6,
                        Text(
                          '- INTITULÉ DU POSTE -',
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.error),
                        ),
                        gapH6,
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod eu lorem et ultricies.',
                          style: context.textTheme.labelLarge,
                          textAlign: TextAlign.justify,
                        ),

                ]),
                  ),
                  gapW20,
                   // Image de profil
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/profile4.png'),
                  ),
                ],
              ),
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
                        _buildExperienceItem(context,'Intitulé du poste', 'employeur','Ville', '05/20XX',' 05/20XX', 'Description...'),
                        _buildExperienceItem(context,'Intitulé du poste', 'employeur','Ville', '06/20XX',' 06/20XX', 'Description...'),
                        _buildExperienceItem(context,'Intitulé du poste', 'employeur','Ville', '07/20XX',' 07/20XX', 'Description...'),
                        SizedBox(height: 16),

                        // Formation
                        Text(
                          'FORMATION',
                          style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.error),
                        ),
                        gapH6,
                        _buildEducationItem(context,'titre', 'Établissement', 'date debut','date fin'),
                        _buildEducationItem(context,'titre', 'Établissement', 'date debut','date fin'),
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
                            '+237 673 66 66 66',
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
                            'prenom.nom@gmail.com',
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
                            'Paris, France',
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
                      Text(
                        'Français: Natif',
                        style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary),
                        ),
                      Text(
                        'Anglais: Avancé',
                        style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary),

                        ),
                      gapH18,
                      // Compétences
                      Text(
                        'COMPÉTENCES',
                        style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.onPrimary),
                        ),
                      gapH12,
                      Row(
                      children: [
                        Icon(Icons.check, color: context.colorScheme.onPrimary, size: 20),
                        gapW10,
                         Flexible(
                          child:Text(
                            'Compétence 1',
                            style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary),
                            overflow: TextOverflow.visible, // (Facultatif) Permet d'assurer que le texte s'affiche complètement
                          ),
                       ),
                      ],
                    ), Row(
                      children: [
                        Icon(Icons.check, color: context.colorScheme.onPrimary, size: 20),
                        gapW10,
                         Flexible(
                          child:Text(
                            'Compétence 2',
                            style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary),
                            overflow: TextOverflow.visible, // (Facultatif) Permet d'assurer que le texte s'affiche complètement
                          ),
                       ),
                      ],
                    ), 
                      gapH6,Row(
                      children: [
                        Icon(Icons.check, color: context.colorScheme.onPrimary, size: 20),
                        gapW10,
                         Flexible(
                          child:Text(
                            'Compétence 3',
                            style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary),
                            overflow: TextOverflow.visible, // (Facultatif) Permet d'assurer que le texte s'affiche complètement
                          ),
                       ),
                      ],
                    ), 
                      gapH18,
                     
                      // Loisirs
                      Text(
                        'LOISIRS',
                          style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.onPrimary),
                        ),
                      gapH12,
                      Text(
                        'Sport',
                        style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary),
                        ),
                      gapH6,
                      Text(
                        'cinéma',
                        style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary),
                        ),
                      
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


