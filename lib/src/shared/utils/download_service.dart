import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:millearnia/src/shared/components/modals/modal.dart';

class DownloadService {
  /// Télécharge un fichier et le déplace dans le dossier "Millearnia" à la racine du stockage principal
  static Future<String?> downloadFile(String fileUrl) async {
    try {
      // Obtenez le répertoire principal du stockage externe
      final externalStorageDir = await getExternalStorageDirectory();
      final rootPath = externalStorageDir?.parent.parent.parent.parent.path;

      if (rootPath == null) {
        showSuccesModal('Erreur : Impossible d’accéder au stockage principal');
        print("[DownloadService] Erreur : Stockage principal inaccessible");
        return null;
      }

      // Définissez le chemin du dossier cible
      final folderPath = "$rootPath/Millearnia"; // Nom du dossier principal
      final fileName = "AlanWalker_MaxAlone.7z";
      final filePath = "$folderPath/$fileName";

      // Créez le dossier "Millearnia" s'il n'existe pas
      final folder = Directory(folderPath);
      if (!await folder.exists()) {
        await folder.create(recursive: true);
        print("[DownloadService] Dossier créé : $folderPath");
      }

      // Téléchargez le fichier dans un emplacement temporaire
      final tempDir = await getTemporaryDirectory();
      final tempFilePath = "${tempDir.path}/$fileName";

      final dio = Dio();
      await dio.download(
        fileUrl,
        tempFilePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            print("[DownloadService] Progression : ${(received / total * 100).toStringAsFixed(0)}%");
          }
        },
      );

      // Déplacez le fichier dans le dossier "Millearnia"
      final tempFile = File(tempFilePath);
      final targetFile = await tempFile.copy(filePath); // Utilisez `copy` au lieu de `rename` pour éviter les erreurs

      showSuccesModal('Téléchargement réussi. Fichier enregistré à : $filePath');
      print("[DownloadService] Fichier déplacé vers : $filePath");

      return targetFile.path;
    } catch (e) {
      showSuccesModal('Erreur de téléchargement');
      print("[DownloadService] Erreur de téléchargement : $e");
      return null;
    }
  }
}
