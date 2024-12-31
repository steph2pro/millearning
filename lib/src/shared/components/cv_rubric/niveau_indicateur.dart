import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/features/auth/login/ui/login_screen.dart';
import 'package:millearnia/src/shared/components/courses/prise.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

class NiveauIndicateur extends StatefulWidget {
  final Function(String) onNiveauChanged;
  final bool? isLang;

  NiveauIndicateur({required this.onNiveauChanged,this.isLang});
  @override
  _NiveauIndicateurState createState() => _NiveauIndicateurState();
}

class _NiveauIndicateurState extends State<NiveauIndicateur> {
  // Liste des niveaux
  final List<String> niveaux = [
    "Débutant",
    "Intermédiaire",
    "Moyen",
    "Bien",
    "Très Bien",
    "Excellent"
  ];

  // Position actuelle du slider
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Niveau",
            style: context.textTheme.bodySmall?.copyWith(fontSize: 13),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Slider(
                value: _currentSliderValue,
                min: 0,
                max: (niveaux.length - 1).toDouble(),
                divisions: niveaux.length - 1,
                activeColor: context.colorScheme.primary,
                inactiveColor: context.colorScheme.tertiary.withOpacity(0.4),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                  widget.onNiveauChanged(niveaux[_currentSliderValue.round()]);
                },
              ),
            ),
            gapW4,
            Text(
              niveaux[_currentSliderValue.round()],
            style: context.textTheme.labelLarge,
            ),
          ],
        ),
      ],
    );
  }
}

