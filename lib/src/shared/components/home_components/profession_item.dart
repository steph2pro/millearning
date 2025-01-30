import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

class ProfessionItem extends StatelessWidget {
  
  final String contentImage;
  final String title;
  final String? profilImage;
  final String name;
  final String btnText;
  final String? prise;
  final VoidCallback? btnTap;

  const ProfessionItem({
    Key? key,
    required this.title,
    this.profilImage,
    this.prise,
    required this.contentImage,
    required this.name,
    required this.btnText,
    this.btnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
      color: Colors.white, // Couleur de fond (modifiable ou transparent)
      border: Border.all(
          color: Theme.of(context).colorScheme.outline, // Couleur de la bordure
        width: 1, // Épaisseur de la bordure
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10), // Rayon des coins arrondis
      ),
    ),
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      child: Stack(
        children: [
          Positioned(
            right: 1,
            top: 1,
            child: IconButton(
                      icon: Icon(
                        size: 24,
                        Icons.bookmark,
                        color: context.colorScheme.primary,
                      ),
                      onPressed: () {},
                )
          ),
          Row(
        children: [
           ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                contentImage,
                fit: BoxFit.cover,
                width: 108,
                height: 108,
              ),
              ),
          gapW12,
         Expanded(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(
                title,
                style: context.textTheme.titleMedium!.copyWith(
                  // fontSize: 14,
                  color: context.colorScheme.outline,
                ),
              ),
            gapH8,
             Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                profilImage != null
                  ? CircleAvatar(
                      radius: 10,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      backgroundImage: AssetImage(profilImage!),
                    )
                  :  CircleAvatar(
                         radius: 10,
                          backgroundColor: Theme.of(context).colorScheme.surface,
                          child: Icon(
                            Icons.person,
                            size: 15,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                    )
                      ,
                      gapW6,
                Text(
              name,
              style: context.textTheme.bodySmall!.copyWith(
                fontSize: 12,
                color: context.colorScheme.outlineVariant,
              ),
            ),
                
              ],
            ),
            gapH12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                 gapW10,
             
            ],
          ),
          Row(
            children: [
              Text(
                prise ??'',
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  color: context.colorScheme.primaryContainer,
                ),
              ),
              gapW10,
               SizedBox(
              width: 49,
              height: 20,
              child:  ElevatedButton(
                onPressed: btnTap, 
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  backgroundColor: context.colorScheme.onPrimaryContainer,
                ),
                child:   Text(
                btnText,
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 10,
                  color: context.colorScheme.secondary,
                ),
                )
              ),
             ),

            ],
          )
         
            ],
          ),
         )
          
         
        ],
      ),
        ],
      )
    );
  }
}
