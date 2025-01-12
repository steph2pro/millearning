import 'dart:convert';
import 'dart:io';
import 'package:millearnia/src/core/routing/app_router.dart';
import 'package:millearnia/src/features/cv/ui/cv_model3_screen.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';


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
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Formation>> fetchFormation() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedFormations = prefs.getStringList('formationList');
  if (savedFormations != null) {
    return savedFormations
        .map((e) => Formation.fromJson(jsonDecode(e)))
        .toList();
  }
  return [];
}

Future<List<Experience>> fetchExperience() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedFormations = prefs.getStringList('experienceList');
  if (savedFormations != null) {
    return savedFormations
        .map((e) => Experience.fromJson(jsonDecode(e)))
        .toList();
  }
  return [];
}

Future<List<Stage>> fetchStage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedFormations = prefs.getStringList('stageList');
  if (savedFormations != null) {
    return savedFormations
        .map((e) => Stage.fromJson(jsonDecode(e)))
        .toList();
  }
  return [];
}

Future<List<Competences>> fetchCompetences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedFormations = prefs.getStringList('competenceList');
  if (savedFormations != null) {
    return savedFormations
        .map((e) => Competences.fromJson(jsonDecode(e)))
        .toList();
  }
  return [];
}

Future<List<Langues>> fetchLangues() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedFormations = prefs.getStringList('langueList');
  if (savedFormations != null) {
    return savedFormations
        .map((e) => Langues.fromJson(jsonDecode(e)))
        .toList();
  }
  return [];
}

Future<List<Loisir>> fetchLoisir() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedFormations = prefs.getStringList('centreInteretList');
  if (savedFormations != null) {
    return savedFormations
        .map((e) => Loisir.fromJson(jsonDecode(e)))
        .toList();
  }
  return [];
}

Future<List<Activite>> fetchActivite() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedFormations = prefs.getStringList('activiteList');
  if (savedFormations != null) {
    return savedFormations
        .map((e) => Activite.fromJson(jsonDecode(e)))
        .toList();
  }
  return [];
}
Future<List<Certificats>> fetchCertificats() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedFormations = prefs.getStringList('certificatList');
  if (savedFormations != null) {
    return savedFormations
        .map((e) => Certificats.fromJson(jsonDecode(e)))
        .toList();
  }
  return [];
}

Future<List<References>> fetchReferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedFormations = prefs.getStringList('referenceList');
  if (savedFormations != null) {
    return savedFormations
        .map((e) => References.fromJson(jsonDecode(e)))
        .toList();
  }
  return [];
}

Future<List<Realisations>> fetchRealisations() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedFormations = prefs.getStringList('realisationList');
  if (savedFormations != null) {
    return savedFormations
        .map((e) => Realisations.fromJson(jsonDecode(e)))
        .toList();
  }
  return [];
}
Future<List<Qualites>> fetchQualites() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedFormations = prefs.getStringList('qualiteList');
  if (savedFormations != null) {
    return savedFormations
        .map((e) => Qualites.fromJson(jsonDecode(e)))
        .toList();
  }
  return [];
}

// //gestion de pdf
//   Future<File> generatePdf() async {
//   final pdf = pw.Document();

//   pdf.addPage(
//     pw.Page(
//       build: (pw.Context context) {
//         return CvModel3Screen();
//       }
//     ),
//   );

//   // Enregistrer le PDF dans un fichier temporaire
//   final directory = await getTemporaryDirectory();
//   final file = File('${directory.path}/example.pdf');
//   await file.writeAsBytes(await pdf.save());
//   return file;
// }