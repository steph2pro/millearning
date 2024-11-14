import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

class CourseContinue extends StatelessWidget {
  
  final String contentImage;
  final String title;
  final String? profilImage;
  final String name;
  final double progress;
  final String btnText;
  final VoidCallback? btnTap;

  const CourseContinue({
    Key? key,
    required this.title,
    this.profilImage,
    required this.contentImage,
    required this.name,
    required this.progress,
    required this.btnText,
    this.btnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progressPercentage = (progress / 25).clamp(0.0, 1.0);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
      color: Colors.white, // Couleur de fond (modifiable ou transparent)
      border: Border.all(
          color: Theme.of(context).colorScheme.outline, // Couleur de la bordure
        width: 2, // Épaisseur de la bordure
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10), // Rayon des coins arrondis
      ),
    ),
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      child: Row(
        children: [
           ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                contentImage,
                fit: BoxFit.cover,
                width: 108,
                height: 108,
              ),
              ),
          gapW12,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
            gapH8,
              Text(
                title,
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  color: context.colorScheme.outline,
                ),
              ),
            gapH8,
             Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                profilImage != null
                  ? CircleAvatar(
                      radius: 5,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      backgroundImage: AssetImage(profilImage!),
                    )
                  :  CircleAvatar(
                         radius: 10,
                          backgroundColor: Theme.of(context).colorScheme.surface,
                          child: Icon(
                            Icons.person,
                            size: 10,
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
    //         Row(
    //         children: [
    //           Container(
    //   width: double.infinity,
    //   height: 7,
    //   decoration: BoxDecoration(
    //     color: context.colorScheme.outline, // Couleur de fond de la barre
    //     borderRadius: BorderRadius.circular(15),
    //   ),
    //   child: Stack(
    //     children: [
    //       Container(
    //         width: progressPercentage * MediaQuery.of(context).size.width,
    //         height: 7,
    //         decoration: BoxDecoration(
    //           color: context.colorScheme.primary, // Couleur de la partie remplie
    //           borderRadius: BorderRadius.circular(15),
    //         ),
    //       ),
    //     ],
    //   ),
    // ),


    //           Text(
    //             '${progress.toString()} /25',
    //             style: context.textTheme.bodySmall!.copyWith(
    //               fontSize: 14,
    //               color: context.colorScheme.primaryContainer,
    //             ),
    //           ),
    //           gapW10,
             
    //         ],
    //       )
            ],
          ),
          
         
        ],
      ),
    );
  }
}
