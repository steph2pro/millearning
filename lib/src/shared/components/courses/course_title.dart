import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

// Course Header Widget
class CourseTitle extends StatelessWidget {
  final double start;
  final double reviews;
  final String title;
  final String name;
  final String? imageProfil;
  final int lessons;
  final int certification;
  VoidCallback? btnTap;

   CourseTitle({
     this.imageProfil,
    required this.title,
    required this.reviews,
    required this.start,
    required this.name,
    required this.lessons,
    required this.certification,
    this.btnTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             SizedBox(
              width: 100,
              height: 30,
              child:  ElevatedButton(
                onPressed: btnTap, 
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  backgroundColor: context.colorScheme.onPrimaryContainer,
                ),
                child:   Text(
                "Best Seller",
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  color: context.colorScheme.secondary,
                ),
                )
              ),
             ),
            
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                  Text(
                    " $start ($reviews reviews)",
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
          ],
        ),
        gapH12,
        Text(
                 title,
                style: context.textTheme.titleSmall,
              )
        ,
        gapH12,
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                imageProfil != null
                  ? CircleAvatar(
                      radius: 10,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      backgroundImage: AssetImage(imageProfil!),
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
                fontSize: 10,
                color: context.colorScheme.outlineVariant,
              ),
            ),
                
              ],
            ),
            Row(
              children: [
                Icon(Icons.play_circle,size: 15,color: Theme.of(context).colorScheme.tertiary,),
                gapW6,
                Text(
                '${lessons.toString()} lessons',
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 10,
                  color: context.colorScheme.outlineVariant,
                ),
                )
              ],
            ),
            Row(
              children: [
                Icon(Icons.star_purple500_rounded,size: 15,color: Theme.of(context).colorScheme.tertiary,),
                gapW6,
                Text(
                  certification !=0
                    ?'${lessons.toString()} certifications'
                    :'certification',
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 10,
                  color: context.colorScheme.outlineVariant,
                ),
                )
              ],
            )
        ],
       )
      ],
    );
  }
}
