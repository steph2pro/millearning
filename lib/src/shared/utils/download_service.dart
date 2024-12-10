import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/shared/utils/file_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:millearnia/src/shared/components/modals/modal.dart';

class DownloadService {
  

/// Télécharge un fichier avec vérification d'espace et nom formaté
  static Future<String?> downloadFile(
    String fileUrl, {
    required Function(double) onProgress,
    int minSpaceMB = 100,
  }) async {
    try {
      // Vérifie si l'espace libre est suffisant
      final hasSpace = await FileUtils.hasEnoughSpace(minSpaceMB: minSpaceMB);
      print(hasSpace);
      if (!hasSpace) {
        showSuccesModal('Erreur : Pas assez d\'espace libre (min $minSpaceMB Mo requis)');
        print("[DownloadService] Pas assez d'espace libre");
        return null;
      }

      // Obtient le répertoire principal du stockage externe
      final externalStorageDir = await getExternalStorageDirectory();
      final rootPath = externalStorageDir?.parent.parent.parent.parent.path;

      if (rootPath == null) {
        showSuccesModal('Erreur : Impossible d’accéder au stockage principal');
        print("[DownloadService] Erreur : Stockage principal inaccessible");
        return null;
      }

      // Définir le chemin et le nom du fichier avec un nombre aléatoire
      final folderPath = "$rootPath/Millearnia";
      final randomSuffix = Random().nextInt(1000000);
      final fileName = "Millearnia_video_$randomSuffix.zip";
      final filePath = "$folderPath/$fileName";

      // Crée le dossier "Millearnia" s'il n'existe pas
      final folder = Directory(folderPath);
      if (!await folder.exists()) {
        await folder.create(recursive: true);
        print("[DownloadService] Dossier créé : $folderPath");
      }

      // Télécharge le fichier dans un emplacement temporaire
      final tempDir = await getTemporaryDirectory();
      final tempFilePath = "${tempDir.path}/$fileName";

      final dio = Dio();
      await dio.download(
        fileUrl,
        tempFilePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            double progress = received / total;
            print("[DownloadService] Progression : ${(progress * 100).toStringAsFixed(0)}%");
            onProgress(progress); // Signale la progression
          }
        },
      );

      // Déplace le fichier dans le dossier "Millearnia"
      final tempFile = File(tempFilePath);
      final targetFile = await tempFile.copy(filePath);
      print('attente de sezipage');
// **Extraction du fichier ZIP**
    final extractTemp = await FileUtils.extractZipToTemporaryDirectory(targetFile);


    showSuccesModal('Téléchargement et extraction réussis. Fichiers extraits à : $extractTemp');
    return extractTemp; // Retourne le chemin des fichiers extraits
  } catch (e) {
    showSuccesModal('Erreur de téléchargement ou d\'extraction');
    print("[DownloadService] Erreur de téléchargement ou d'extraction : $e");
    return null;
    }
  }

}
