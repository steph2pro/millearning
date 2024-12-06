import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppInitializer {
  /// Initialize services, plugins, etc. before the app runs.
  Future<void> preAppRun() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      // Initialiser Supabase
    await Supabase.initialize(
      url: 'https://eiwdwnllcxkqgqapkbvx.supabase.co', // Remplacez par votre URL
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVpd2R3bmxsY3hrcWdxYXBrYnZ4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMyMTM2MzgsImV4cCI6MjA0ODc4OTYzOH0.MigNmJX1TbXDIcdxIBk5KzQsUKMPEj8-vLxhVjAUhOk',    // Remplacez par votre anon key
    );
  }

  /// Initialize services, plugins, etc. after the app runs.
  Future<void> postAppRun() async {
    // Hide RSOD in release mode.
    if (kReleaseMode) {
      ErrorWidget.builder = (FlutterErrorDetails details) => const SizedBox();
    }
  }
}
