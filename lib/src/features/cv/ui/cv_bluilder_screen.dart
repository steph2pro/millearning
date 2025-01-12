import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/shared/components/cv_rubric/activite_extra_scolaire.dart';
import 'package:millearnia/src/shared/components/cv_rubric/centre_interet.dart';
import 'package:millearnia/src/shared/components/cv_rubric/certificat.dart';
import 'package:millearnia/src/shared/components/cv_rubric/competence.dart';
import 'package:millearnia/src/shared/components/cv_rubric/experience_professionel.dart';
import 'package:millearnia/src/shared/components/cv_rubric/formation_professionel.dart';
import 'package:millearnia/src/shared/components/cv_rubric/information_personel.dart';
import 'package:millearnia/src/shared/components/cv_rubric/langue.dart';
import 'package:millearnia/src/shared/components/cv_rubric/profil.dart';
import 'package:millearnia/src/shared/components/cv_rubric/qualite.dart';
import 'package:millearnia/src/shared/components/cv_rubric/realisation.dart';
import 'package:millearnia/src/shared/components/cv_rubric/reference.dart';
import 'package:millearnia/src/shared/components/cv_rubric/stage_professionel.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';

@RoutePage()
class CvBuilderScreen extends StatefulWidget {
  const CvBuilderScreen({super.key});

  @override
  State<CvBuilderScreen> createState() => _CvBuilderScreenState();
}

class _CvBuilderScreenState extends State<CvBuilderScreen> {
  
  //gestion de pdf
  Future<File> generatePdf() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Text(
          "Ceci est un exemple de page Flutter convertie en PDF.",
          style: pw.TextStyle(fontSize: 18),
        ),
      ),
    ),
  );

  // Enregistrer le PDF dans un fichier temporaire
  final directory = await getTemporaryDirectory();
  final file = File('${directory.path}/example.pdf');
  await file.writeAsBytes(await pdf.save());
  return file;
}

  int currentStep = 0;
  int model=3;
  String nom='';
  Future<void> fetchModel() async {
  final prefs = await SharedPreferences.getInstance();
  model = prefs.getInt('model')!;

  nom = prefs.getString('name')?? '';

}
  final List<Widget> steps = [
    InformationPersonel(),
    ProfilePage(),
    FormationProfessionel(),
    ExperienceProfessionel(),
    Competence(),
    Langue(),
    CentreInteret(),
    StageProfessionel(),
  ];

  final List<String> stepTitles = [
    'Informations Personnelles',
    'Profil',
    'Formation Professionnelle',
    'Experience Professionnelle',
    'Competences',
    'Langues',
    'Centre d\'interet',
    'Stages',
  ];

  final List<String> addedRubrics = [];

  void nextStep() {
    if (currentStep < steps.length - 1) {
      setState(() {
        currentStep++;
      });
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  void addRubric(String title, Widget widget) {
    if (!addedRubrics.contains(title)) {
      setState(() {
        steps.add(widget);
        stepTitles.add(title);
        addedRubrics.add(title);
        currentStep = steps.length - 1;
      });
    }
  }
  void removeRubric(String title) {
    final index = stepTitles.indexOf(title);
    if (index != -1) {
      setState(() {
        steps.removeAt(index);
        stepTitles.removeAt(index);
        addedRubrics.remove(title);

        // Ajuster l'étape courante si nécessaire
        if (currentStep >= steps.length) {
          currentStep = steps.length - 1;
        }
      });
    }
  }
   @override
  void initState() {
    super.initState();
    fetchModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'cv de $nom',
          style: context.textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: context.colorScheme.onPrimary,
      ),
        backgroundColor: context.colorScheme.onPrimary,
      body: ListView(
        padding: EdgeInsets.all(Dimens.spacing),
        children: [
          Stack(
            children: [
              Text(
                stepTitles[currentStep],
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge,
              ),
              if (addedRubrics.contains(stepTitles[currentStep]))
                Positioned(
                  right: 0,
                  top: 0,
                  child: InkWell(
                    onTap: () => removeRubric(stepTitles[currentStep]),
                    child: Icon(Icons.close,color:  context.colorScheme.error,),
                  )
                  //  IconButton(
                  //   onPressed: () => removeRubric(stepTitles[currentStep]),
                  //   icon: Icon(Icons.close, color: Colors.red,size: 25,),
                  //   tooltip: 'Supprimer cette rubrique',
                  // ),
                ),
            ],
          ),
          gapH16,
              steps[currentStep],
          gapH16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (currentStep > 0)
                SizedBox(
                  width:155,
                  child:ElevatedButton.icon(
                  onPressed: previousStep,
                  icon: Icon(Icons.arrow_back),
                  label: Text('Précédent',style:TextStyle(fontSize:12)),
                ),
                ),
              if (currentStep < steps.length - 1)
                 SizedBox(
                  width:155,
                  child:ElevatedButton.icon(
                  onPressed: nextStep,
                  icon: Icon(Icons.arrow_forward),
                  label: Text('Suivant',style:TextStyle(fontSize:12)),
                )),
              if (currentStep == steps.length - 1)
                 SizedBox(
                  width:155,
                  child:ElevatedButton.icon(
                  onPressed: () {
                    print('Création du CV terminée');
                    if(model==1){
                    context.pushRoute(CvModelRoute());

                    }else if(model==2){
                    context.pushRoute(CvModel2Route());

                    }else if(model ==3){
                    context.pushRoute(CvModel3Route());
                    }
                  },
                  icon: Icon(Icons.check),
                  label: Text('Terminer',style:TextStyle(fontSize:12)),
                 )),
            ],
          ),
          if (currentStep == steps.length - 1) ...[
            gapH16,
            Wrap(
              spacing: 8,
              runSpacing: 10,
              children: [
                if (!addedRubrics.contains('Références'))
                  OutlinedButton.icon(
                    onPressed: () => addRubric('Références', Reference()),
                    icon: Icon(Icons.add),
                    label: Text('Références'),
                  ),
                if (!addedRubrics.contains('Qualités'))
                  OutlinedButton.icon(
                    onPressed: () => addRubric('Qualités', Qualite()),
                    icon: Icon(Icons.add),
                    label: Text('Qualités'),
                  ),
                if (!addedRubrics.contains('Certificats'))
                  OutlinedButton.icon(
                    onPressed: () => addRubric('Certificats', Certificat()),
                    icon: Icon(Icons.add),
                    label: Text('Certificats'),
                  ),
                if (!addedRubrics.contains('Realisation'))
                  OutlinedButton.icon(
                    onPressed: () => addRubric('Realisation', Realisation()),
                    icon: Icon(Icons.add),
                    label: Text('Realisation'),
                  ),
                if (!addedRubrics.contains('Activite extra-scolaire'))
                  OutlinedButton.icon(
                    onPressed: () => addRubric('Activite extra-scolaire', ActiviteExtraScolaire()),
                    icon: Icon(Icons.add),
                    label: Text('Activite extra-scolaire'),
                  ),
              ],
            ),
          ],
          gapH30,
        ],
      ),
    );
  }
}
