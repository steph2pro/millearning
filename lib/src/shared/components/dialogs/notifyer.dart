import 'package:flutter/material.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

class Notifyer {
  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
    double borderRadius = 8.0,
  }) {
    final overlay = Overlay.of(context);
    if (overlay == null) return;

    // Créer un OverlayEntry
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10, // Espacement depuis le haut
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: 1.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Text(
                message,
                style: TextStyle(color: textColor, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );

    // Ajouter l'OverlayEntry à l'écran
    overlay.insert(overlayEntry);

    // Supprimer l'OverlayEntry après la durée spécifiée
    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}
