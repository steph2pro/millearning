import 'package:flutter/material.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';


class NiveauIndicateur extends StatelessWidget {
  final String level;
  final Map<String, int> levelMap = {
    "Débutant": 1,
    "Intermédiaire": 2,
    "Moyen": 3,
    "Bien": 4,
    "Très Bien": 5,
    "Excellent": 6,
  };

  NiveauIndicateur({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int filledCircles = levelMap[level] ?? 0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(6, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Icon(
            Icons.circle,
            size: 16,
            color: index < filledCircles ? context.colorScheme.primary :context.colorScheme.tertiaryContainer,
          ),
        );
      }),
    );
  }
}