import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

class Menu extends StatelessWidget {
  final List<String> items;
  final ValueChanged<int> onItemSelected;

  const Menu({
    Key? key,
    required this.items,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: items.length,
      child: Column(
        children: [
          TabBar(
            onTap: onItemSelected,
            tabs: items
                .map(
                  (item) => Tab(
                    child: Text(
                      item,
                      style: context.textTheme.labelLarge,
                    ),
                  ),
                )
                .toList(),
            labelColor: context.colorScheme.primary, // Couleur des onglets sélectionnés
            unselectedLabelColor: context.colorScheme.outline, // Couleur des onglets non sélectionnés
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 5.0,
                color: context.colorScheme.primary, // Couleur de l'indicateur
              ),
              insets: EdgeInsets.symmetric(horizontal: 0.0),
            ),
          ),
          gapH10,
          // Ajoutez un contenu en fonction de la sélection si nécessaire
        ],
      ),
    );
  }
}
