import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

class FormationCard extends StatelessWidget {
  final String title;
  final String? etablissement;
  final String? ville;
  final VoidCallback edit;

  const FormationCard({
    Key? key,
    required this.title,
     this.etablissement,
     this.ville,
    required this.edit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        border: Border.all(
          color: context.colorScheme.tertiary, // Couleur noire pour les bordures
          width: 1, // Épaisseur de la bordure
        ),
        borderRadius: BorderRadius.circular(10), // Coins arrondis à 10
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
             child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
            children: [
              Text(
                title,
                // .length > 15 ? '${title.substring(0, 15)}...' : title,
                style: context.textTheme.titleMedium,
              ),
              ville != null 
                ? Text(
                  '$etablissement ,$ville',
                  style: context.textTheme.labelLarge,
                  )
                : Text(
                  etablissement ?? '',
                  style: context.textTheme.labelLarge,
                  )
              ,
            ],
          ),
             )
          ),
          InkWell(
            onTap: edit,
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
              color: context.colorScheme.onPrimary,
              border: Border.all(
                color: context.colorScheme.primary, 
                width: 2, 
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.edit, size: 20,color: context.colorScheme.primary,),
            ),
          )
        
        ],
      ),
    );
  }
  }