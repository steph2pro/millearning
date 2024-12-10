import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:archive/archive_io.dart';
import 'package:flutter_archive/flutter_archive.dart' as flutter_archive;
class FileUtils {
  /// Vérifie si l'espace libre est suffisant
  /// [minSpaceMB] représente la taille minimale requise en méga-octets (par défaut : 100 Mo).
  static Future<bool> hasEnoughSpace({int minSpaceMB = 100}) async {
    try {
      // Obtenir le répertoire principal du stockage
      final directory = await getApplicationDocumentsDirectory();

      // Récupérer les informations d'espace libre
      final stats = await _getDiskSpace(directory.path);

      if (stats == null) {
        print("[StorageService] Erreur : Impossible d'obtenir les statistiques d'espace.");
        return false;
      }

      final freeSpaceMB = stats['available']!; 
      print("[StorageService] Espace libre disponible : $freeSpaceMB Mo");

      return freeSpaceMB >= minSpaceMB;
    } catch (e) {
      print("[StorageService] Erreur lors de la vérification de l'espace libre : $e");
      return false;
    }
  }

  /// Récupère l'espace disque disponible et total
  /// Utilise le chemin fourni pour déterminer l'espace disque
  static Future<Map<String, int>?> _getDiskSpace(String path) async {
    try {
      // Utilisation des commandes système pour déterminer l'espace disque sur Android/iOS
      final stat = await FileStat.stat(path);

      final freeSpace = stat.size; // Sur certains systèmes, `size` représente l'espace libre
      final totalSpace = stat.mode; // Sur certains systèmes, `mode` peut refléter l'espace total

      return {"available": freeSpace, "total": totalSpace};
    } catch (e) {
      print("[StorageService] Erreur lors de l'obtention des statistiques disque : $e");
      return null;
    }
  }
   
  /// Retourne le répertoire temporaire.
  static Future<Directory> getTemporaryDirectory2() async {
    return await getTemporaryDirectory();
  }

  /// Décompresse un fichier ZIP dans un répertoire donné.
static Future<String?> extractZipToTemporaryDirectory(File zipFilePath) async {
  try {
    print("[ExtractService] Chemin du fichier ZIP : ${zipFilePath}");
    print('dezipper');

    // Crée un répertoire temporaire pour l'extraction
    final tempDir = await getTemporaryDirectory();
    final tempDirPath = "${tempDir.path}";
    print("[ExtractService] Répertoire temporaire : $tempDirPath");

    // Vérifie si le fichier ZIP existe
    if (!await zipFilePath.exists()) {
      print("[ExtractService] Le fichier ZIP n'existe pas. Chemin : ${zipFilePath.path}");
      return null;
    } else {
      print("[ExtractService] Le fichier ZIP existe !");
    }

    // Extraction du fichier ZIP
    await flutter_archive.ZipFile.extractToDirectory(
      zipFile: zipFilePath,
      destinationDir: tempDir,
    );

    print("[ExtractService] Extraction réussie dans : ${tempDir.path}");

    // Liste tous les fichiers extraits
    final extractedFiles = (await Directory(tempDir.path)
            .list(recursive: true)
            .toList())
        .whereType<File>()
        .toList();

    if (extractedFiles.isNotEmpty) {
      // Cherche le premier fichier .mp4
      final videoFile = extractedFiles.firstWhere(
        (file) => file.path.endsWith(".mp4"),
        orElse: () => extractedFiles.first,
      );

      if (videoFile != null) {
        print("[ExtractService] Vidéo extraite : ${videoFile}");
        return videoFile.path; // Retourne le chemin extrait
      }
    }

    print("[ExtractService] Aucun fichier vidéo trouvé après extraction.");
    return null;
  } catch (e, stackTrace) {
    print("[ExtractService] Erreur : $e");
    print("[ExtractService] Trace : $stackTrace");
    return null;
  }
}



}
