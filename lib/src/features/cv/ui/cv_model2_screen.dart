import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
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
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class CvModel2Screen extends StatefulWidget {
  const CvModel2Screen({super.key});

  @override
  State<CvModel2Screen> createState() => _CvModel2ScreenState();
}

class _CvModel2ScreenState extends State<CvModel2Screen> {
  String? pdfPath;

 
  //  Future<void> _createPdf() async {
  //   final pdf = pw.Document();

  //   // Ajout d'une page au PDF
  //   pdf.addPage(
  //     pw.Page(
  //       build: (pw.Context context) => pw.Center(
  //         child: pw.Text(
  //           "Ceci est une prévisualisation d'une page Flutter en PDF.",
  //           style: pw.TextStyle(fontSize: 20),
  //         ),
  //       ),
  //     ),
  //   );

  //   // Sauvegarde dans un fichier temporaire
  //   final directory = await getTemporaryDirectory();
  //   final file = File('${directory.path}/preview.pdf');
  //   await file.writeAsBytes(await pdf.save());

  //   setState(() {
  //     pdfPath = file.path;
  //   });
  // }
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
    
    _createPdf();
  }
  
   Future<void> _createPdf() async {
    final pdf = pw.Document();

    // Ajout d'une page au PDF
    pdf.addPage(
      pw.Page(
        
        build: (pw.Context context) {
          return pw.ListView(
            children: [
             pw.Container(
              color: PdfColor.fromInt(0xFF000000),
              child:  pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Colonne principale avec deux sections : Gauche et Droite
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // Section gauche (Profil et Contact)
                   pw.Expanded(
                    flex: 1,
                    child:  pw.Container(
                     
                      // color: PdfColor.fromInt(0xFF000000),
                      // padding:  pw.EdgeInsets.all(10.0),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          // Photo de profil
                          pw.Center(
                            child: pw.Container(
                      width: 118, 
                      height: 118,
                      decoration: pw.BoxDecoration(
                      shape: pw.BoxShape.circle,
                    ),
                    child: pw.ClipOval(
                      child: _profileImageBytes != null
                          ? pw.Image(
                              pw.MemoryImage(
                              _profileImageBytes!,
                            ),
                              fit: pw.BoxFit.cover, 
                            )
                          : pw.Container(
                              color: PdfColor.fromInt(0xFFFFFFFF),
                              child: pw.Center(
                                child: pw.Text(
                                  '👤', 
                                  style: pw.TextStyle(
                                    fontSize: 50,
                                    color: PdfColor.fromInt(0xFF3C3C3C),
                                  ),
                              ),
                              )
                            ),
                    ),
                  ),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Container(
                    height: 1,
                    width: double.infinity, 
                    margin: pw.EdgeInsets.symmetric(vertical: 5), 
                    decoration: pw.BoxDecoration(
                      color:  PdfColor.fromInt(0xFFFFFFFF), 
                      borderRadius: pw.BorderRadius.circular(4),
                    ),
                  ),
                  // Profil
                           pw.Text(
                            "PROFIL",
                            textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 20,
                            color:PdfColor.fromInt(0xFFFFFFFF), 
                          )
                          ),
                  pw.Container(
                    height: 1,
                    width: double.infinity, 
                    margin: pw.EdgeInsets.symmetric(vertical: 5), 
                    decoration: pw.BoxDecoration(
                      color:  PdfColor.fromInt(0xFFFFFFFF), 
                      borderRadius: pw.BorderRadius.circular(4),
                    ),
                  ),
                  pw.SizedBox(height: 8),

                           pw.Text(
                            profil,
                            style:  pw.TextStyle(
                              color: PdfColor.fromInt(0xFFFFFFFF), fontWeight: pw.FontWeight.bold, fontSize: 14
                            ),
                            textAlign: pw.TextAlign.justify,
                            ),
                  pw.SizedBox(height: 18),
                          pw.Container(
                    height: 1,
                    width: double.infinity, 
                    margin: pw.EdgeInsets.symmetric(vertical: 5), 
                    decoration: pw.BoxDecoration(
                      color:  PdfColor.fromInt(0xFFFFFFFF), 
                      borderRadius: pw.BorderRadius.circular(4),
                    ),
                  ),
                           pw.Text(
                            "CONTACT",
                          style: pw.TextStyle(
                              color: PdfColor.fromInt(0xFFFFFFFF), fontWeight: pw.FontWeight.bold, fontSize: 14
                            ),
                          ),
                          pw.Container(
                    height: 1,
                    width: double.infinity, 
                    margin: pw.EdgeInsets.symmetric(vertical: 5), 
                    decoration: pw.BoxDecoration(
                      color:  PdfColor.fromInt(0xFFFFFFFF), 
                      borderRadius: pw.BorderRadius.circular(4),
                    ),
                  ),
                          pw.SizedBox(height: 10),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(bottom: 6),
                            child: pw.Row(
                              children: [
                                // pw.Icon(icon, color:context.colorScheme.onPrimary,size: 20,),
                                // pw.gapW10,
                                pw.Flexible(
                                  child: pw.Text(telephone, 
                                    style: pw.TextStyle(
                                      color: PdfColor.fromInt(0xFFFFFFFF), fontSize: 14,fontWeight: pw.FontWeight.normal
                                    ),
                                    ),
                                )
                              ],
                            ),
                          ),
                          pw.SizedBox(height: 10),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(bottom: 6),
                            child: pw.Row(
                              children: [
                                // pw.Icon(icon, color:context.colorScheme.onPrimary,size: 20,),
                                // pw.gapW10,
                                pw.Flexible(
                                  child: pw.Text(email, 
                                    style: pw.TextStyle(
                                      color: PdfColor.fromInt(0xFFFFFFFF), fontSize: 14,fontWeight: pw.FontWeight.normal
                                    ),
                                    ),
                                )
                              ],
                            ),
                          ),
                          pw.SizedBox(height: 10),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(bottom: 6),
                            child: pw.Row(
                              children: [
                                // pw.Icon(icon, color:context.colorScheme.onPrimary,size: 20,),
                                // pw.gapW10,
                                pw.Flexible(
                                  child: pw.Text( '$address, $ville', 
                                    style: pw.TextStyle(
                                      color: PdfColor.fromInt(0xFFFFFFFF), fontSize: 14,fontWeight: pw.FontWeight.normal
                                    ),
                                    ),
                                )
                              ],
                            ),
                          ),
                          
                          pw.SizedBox(height: 10),
                           pw.Container(
                    height: 1,
                    width: double.infinity, 
                    margin: pw.EdgeInsets.symmetric(vertical: 5), 
                    decoration: pw.BoxDecoration(
                      color:  PdfColor.fromInt(0xFFFFFFFF), 
                      borderRadius: pw.BorderRadius.circular(4),
                    ),
                  ),
                           pw.Text(
                            "Loisirs",
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 20,
                            color:PdfColor.fromInt(0xFFFFFFFF), 
                          )
                          ),
                          pw.Container(
                    height: 1,
                    width: double.infinity, 
                    margin: pw.EdgeInsets.symmetric(vertical: 5), 
                    decoration: pw.BoxDecoration(
                      color:  PdfColor.fromInt(0xFFFFFFFF), 
                      borderRadius: pw.BorderRadius.circular(4),
                    ),
                  ),
                          pw.Row(
                            children: [
                                //  Parallelograme(
                                //   width: 25,
                                //   height: 100,
                                //   startColor: Colors.yellow.shade700,
                                //   endColor: Colors.yellow,
                                // ),
                          pw.SizedBox(height: 10),

                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.SizedBox(height: 10),
                              ...loisirs.map((loisir){

                                return pw.Padding(
                                  padding: const pw.EdgeInsets.symmetric(vertical: 5),
                                  child: pw.Text(
                                    '- ${loisir.loisir}',
                                    style: const pw.TextStyle(color: PdfColor.fromInt(0xFFFFFFFF)),
                                  ),
                                );

                              }).toList(),


                        ])
                            ])
                        ])
                    ),
                    ),
                     // Section droite (Expérience, Éducation et Intérêts)
                    pw.Expanded(
                      flex: 2,
                      child: pw.Container(
                        color:PdfColor.fromInt(0xFFFFFFFF),
                        padding:  pw.EdgeInsets.symmetric(horizontal: 10),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Row(
                            children: [ 
                              // Nom et prénom
                             pw.Expanded(
                             child: pw.Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Flexible(
                              // child:
                               pw.Text(
                                nomComplet ,
                                style: pw.TextStyle(
                                  color: PdfColor.fromInt(0xFF5C5C5C), 
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 24
                                )
   
                              ),
                            // ),
                              
              pw.SizedBox(height: 6),
                              pw.Text(
                                titre,
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                  color: PdfColor.fromInt(0XFF09090B), 
                                  fontWeight: pw.FontWeight.bold, 
                                  fontSize: 18
                                )
                              ),
                              ] ),
                             ),
                          ]),
                          pw.Container(
                            height: 1,
                            width: double.infinity, 
                            margin: pw.EdgeInsets.symmetric(vertical: 10,horizontal: 25), 
                            decoration: pw.BoxDecoration(
                              color: PdfColor.fromInt(0xFF000000), 
                              borderRadius: pw.BorderRadius.circular(4),
                            ),
                          ),
                             pw.Text(
                              "EXPÉRIENCE",
                              style: pw.TextStyle(
                                  color: PdfColor.fromInt(0XFF09090B), 
                                  fontWeight: pw.FontWeight.bold, 
                                  fontSize: 18
                                )
                            ),
                          pw.Container(
                            height: 1,
                            width: double.infinity, 
                            margin: pw.EdgeInsets.symmetric(vertical: 10,horizontal: 25), 
                            decoration: pw.BoxDecoration(
                              color: PdfColor.fromInt(0xFF000000), 
                              borderRadius: pw.BorderRadius.circular(4),
                            ),
                          ),
                           ...experiences.map((experience){
                            return  pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 10),
    child: pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
       pw.Container(
        width: 10, 
        height: 10, 
        decoration: pw.BoxDecoration(
          color: PdfColor.fromInt(0xFF000000), // Couleur du point
          shape: pw.BoxShape.circle, // Forme circulaire
        ),
      ),
        pw.SizedBox(width: 10), // gapW10 peut être remplacé par SizedBox si c'est juste un espace
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.RichText(
                text: pw.TextSpan(
                  children: [
                    pw.TextSpan(
                      text: "${experience.poste.toUpperCase()}  ",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xFF3C3C3C), fontSize: 14
                      ),
                    ),
                    pw.TextSpan(
                      text: "${experience.employeur} ",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xFF3C3C3C), fontWeight: pw.FontWeight.bold, fontSize: 14
                      ),
                    ),
                    pw.TextSpan(
                      text: '${experience.dateDebut} - ${experience.dateFin}',
                      style:pw.TextStyle(
                        color: PdfColor.fromInt(0xFF3C3C3C), fontSize: 14
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 2),
              pw.Text(
                experience.description,
                style: pw.TextStyle(
                        color: PdfColor.fromInt(0xFF3C3C3C), fontSize: 14
                      ),
                textAlign: pw.TextAlign.justify,
              ),
            ],
          ),
        ),
      ],
    ),
  );
                           }).toList(),
                           pw.Container(
                            height: 1,
                            width: double.infinity, 
                            margin: pw.EdgeInsets.symmetric(vertical: 10,horizontal: 25), 
                            decoration: pw.BoxDecoration(
                              color: PdfColor.fromInt(0xFF000000), 
                              borderRadius: pw.BorderRadius.circular(4),
                            ),
                          ),
                             pw.Text(
                              "FORMATIONS",
                              style: pw.TextStyle(
                                  color: PdfColor.fromInt(0XFF09090B), 
                                  fontWeight: pw.FontWeight.bold, 
                                  fontSize: 18
                                )
                            ), 
                           pw.Container(
                            height: 1,
                            width: double.infinity, 
                            margin: pw.EdgeInsets.symmetric(vertical: 10,horizontal: 25), 
                            decoration: pw.BoxDecoration(
                              color: PdfColor.fromInt(0xFF000000), 
                              borderRadius: pw.BorderRadius.circular(4),
                            ),
                          ),
                          pw.SizedBox(height: 10),
                            
                           ...formations.map((formation){
                            return  pw.Padding(
      padding:  pw.EdgeInsets.only(bottom: 10),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [     
       pw.Container(
        width: 10, 
        height: 10, 
        decoration: pw.BoxDecoration(
          color: PdfColor.fromInt(0xFF000000), // Couleur du point
          shape: pw.BoxShape.circle, // Forme circulaire
        ),
      ),
        pw.SizedBox(width: 10), 
              pw.Container(
                width: 90,
                child:  pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Flexible(
                    child: pw.Text(
                    formation.etablissement,
                      style:pw.TextStyle(
                        color: PdfColor.fromInt(0xFF3C3C3C), fontSize: 14,fontWeight: pw.FontWeight.bold
                      ),
                  ) 
                  ), 

                ],
              ),
            pw.Text(
               '${formation.dateDebut }- ${formation.dateFin}',
                style: pw.TextStyle(
                        color: PdfColor.fromInt(0xFF3C3C3C), fontSize: 14,fontWeight: pw.FontWeight.normal
                      ),
            ),   
            pw.Text(
               formation.ville,
                style: pw.TextStyle(
                        color: PdfColor.fromInt(0xFF3C3C3C), fontSize: 14,fontWeight: pw.FontWeight.normal
                      ),
            ) , 
            ],
          ),
              ),
         
          pw.SizedBox(width: 4), 
          pw.Expanded(
            child: 
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              
            pw.Text(
               formation.titre.toUpperCase(),
                style:pw.TextStyle(
                        color: PdfColor.fromInt(0xFF3C3C3C), fontSize: 14
                      ),
            ) ,
            pw.Container(
              width:110,
              child: pw.Text(
               formation.description,
                style: pw.TextStyle(
                        color: PdfColor.fromInt(0xFF3C3C3C), fontSize: 14,fontWeight: pw.FontWeight.bold
                      ),
                textAlign: pw.TextAlign.justify,
            )   ,
            )
            ],
          ),
          
          )
        ],
      ),
    );
                           }).toList(),

                          pw.SizedBox(height: 18),

                           pw.Container(
                            height: 1,
                            width: double.infinity, 
                            margin: pw.EdgeInsets.symmetric(vertical: 10,horizontal: 25), 
                            decoration: pw.BoxDecoration(
                              color: PdfColor.fromInt(0xFF000000), 
                              borderRadius: pw.BorderRadius.circular(4),
                            ),
                          ),
                            pw.Text(
                              "STAGE",
                              style: pw.TextStyle(
                                  color: PdfColor.fromInt(0XFF09090B), 
                                  fontWeight: pw.FontWeight.bold, 
                                  fontSize: 18
                                )
                            ),
                          pw.Container(
                            height: 1,
                            width: double.infinity, 
                            margin: pw.EdgeInsets.symmetric(vertical: 10,horizontal: 25), 
                            decoration: pw.BoxDecoration(
                              color: PdfColor.fromInt(0xFF000000), 
                              borderRadius: pw.BorderRadius.circular(4),
                            ),
                          ),
                           ...stages.map((experience){
                            return  pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 10),
    child: pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
       pw.Container(
        width: 10, 
        height: 10, 
        decoration: pw.BoxDecoration(
          color: PdfColor.fromInt(0xFF000000), // Couleur du point
          shape: pw.BoxShape.circle, // Forme circulaire
        ),
      ),
        pw.SizedBox(width: 10), // gapW10 peut être remplacé par SizedBox si c'est juste un espace
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.RichText(
                text: pw.TextSpan(
                  children: [
                    pw.TextSpan(
                      text: "${experience.poste.toUpperCase()}  ",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xFF3C3C3C), fontSize: 14
                      ),
                    ),
                    pw.TextSpan(
                      text: "${experience.employeur} ",
                      style: pw.TextStyle(
                        color: PdfColor.fromInt(0xFF3C3C3C), fontWeight: pw.FontWeight.bold, fontSize: 14
                      ),
                    ),
                    pw.TextSpan(
                      text: '${experience.dateDebut} - ${experience.dateFin}',
                      style:pw.TextStyle(
                        color: PdfColor.fromInt(0xFF3C3C3C), fontSize: 14
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 2),
              pw.Text(
                experience.description,
                style: pw.TextStyle(
                        color: PdfColor.fromInt(0xFF3C3C3C), fontSize: 14
                      ),
                textAlign: pw.TextAlign.justify,
              ),
            ],
          ),
        ),
      ],
    ),
  );
                           }).toList(),
                           pw.Container(
                            height: 1,
                            width: double.infinity, 
                            margin: pw.EdgeInsets.symmetric(vertical: 10,horizontal: 25), 
                            decoration: pw.BoxDecoration(
                              color: PdfColor.fromInt(0xFF000000), 
                              borderRadius: pw.BorderRadius.circular(4),
                            ),
                          ),
                           


                     ])
                      )
                      )

                  ])
            ])
   
             )
              
            ],
          );
        }
      ),
    );

    // Sauvegarde dans un fichier temporaire
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/preview.pdf');
    await file.writeAsBytes(await pdf.save());

    setState(() {
      pdfPath = file.path;
    });
    //printing 
    if(pdfPath!=''){
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );  
    }
  }
  Future<void> _downloadPdf() async {
  try {
    // Obtenir le répertoire des documents
    final directory = await getApplicationDocumentsDirectory();

    // Chemin complet du dossier Millearnia/cv
    final String folderPath = "${directory.path}/Millearnia/cv";

    // Créer le dossier Millearnia/cv si ce n'est pas déjà fait
    final folder = Directory(folderPath);
    if (!await folder.exists()) {
      await folder.create(recursive: true);
    }
    

    // Définir le chemin complet du fichier
    final String fileName = "cv_$nomComplet.pdf";
    final String newFilePath = "$folderPath/$fileName";

    // Copier le fichier PDF existant vers le nouvel emplacement
    final File pdfFile = File(pdfPath ?? '');
    final File newFile = await pdfFile.copy(newFilePath);

    print("Fichier téléchargé dans : $newFilePath");

    // Afficher un message de confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Fichier téléchargé dans : $newFilePath"),
      ),
    );
  } catch (e) {
    print("Erreur lors du téléchargement : $e");

    // Afficher un message d'erreur
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Erreur lors du téléchargement : $e"),
      ),
    );
  }
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
      
        // backgroundColor: context.colorScheme.scrim,
      body:  
      // CvModel2()
      pdfPath == null
          ? Center(child: CircularProgressIndicator())
          : PDFView(
              filePath: pdfPath,
              enableSwipe: true,
              swipeHorizontal: false,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createPdf, // Appeler la méthode de téléchargement
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.download),
      ),
    );
  }
 Widget CvModel2(){
  return ListView(
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