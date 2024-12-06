import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path_provider/path_provider.dart';

class SupabaseService {
  static Future<String?> downloadZipFile(String bucket, String filePath) async {
    try {
      final client = Supabase.instance.client;

      // Téléchargement du fichier (renvoie un Uint8List directement)
      final response = await client.storage.from(bucket).download(filePath);

      // Sauvegarder le fichier temporairement
      final tempDir = await getTemporaryDirectory();
      final file = File("${tempDir.path}/video.zip");
      await file.writeAsBytes(response);

      return file.path; // Chemin du fichier temporaire
    } catch (e) {
      print("Erreur lors du téléchargement : $e");
      return null;
    }
  }
}
