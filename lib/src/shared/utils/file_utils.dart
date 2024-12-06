import 'dart:io';
import 'package:flutter/material.dart';
import 'package:millearnia/src/shared/utils/supabase_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:archive/archive_io.dart';

class FileUtils {
  /// Vérifie si l'espace libre est suffisant.
  static Future<bool> hasEnoughSpace({required int minSpaceMB}) async {
    final tempDir = await getTemporaryDirectory();
    final stats = await tempDir.stat();
    final freeSpace = stats.size / (1024 * 1024); // Convertit en Mo.
    return freeSpace >= minSpaceMB;
  }

  /// Retourne le répertoire temporaire.
  static Future<Directory> getTemporaryDirectory() async {
    return await getTemporaryDirectory();
  }

  /// Décompresse un fichier ZIP dans un répertoire donné.
  static Future<String> unzipFile(String zipFilePath) async {
    final bytes = File(zipFilePath).readAsBytesSync();
    final archive = ZipDecoder().decodeBytes(bytes);
    final outputDir = await getApplicationDocumentsDirectory();

    for (final file in archive.files) {
      final outFilePath = "${outputDir.path}/${file.name}";

      if (file.isFile) {
        final outFile = File(outFilePath);
        await outFile.create(recursive: true);
        await outFile.writeAsBytes(file.content as List<int>);
      } else {
        Directory(outFilePath).createSync(recursive: true);
      }
    }
    return outputDir.path;
  }

 

}
