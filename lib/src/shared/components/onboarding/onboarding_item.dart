import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';


class OnboardingItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? titlecolor;
  final String? titlesecond;
  final String description;

  const OnboardingItem({
    super.key,
    required this.imageUrl,
    required this.title,this.titlecolor,this.titlesecond,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.p25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Spacer(),
            Expanded(
              child: Image.asset(
                imageUrl,
                width: double.infinity,
              ),
            ),
            gapH30,
            Expanded(
              child: Column(
                children: [
                   RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:   '${title} ', // Texte traduit
                          style: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700)
                          ),
                        if(titlecolor!=null && titlesecond == null)...[
                          TextSpan(
                              text: titlecolor, // Texte traduit
                              style: context.textTheme.bodyLarge!.copyWith(color: context.colorScheme.secondary,fontWeight: FontWeight.w700)
                            ),
                        
                          
                        ]else...[
                          TextSpan(
                              text: titlecolor, // Texte traduit
                              style: context.textTheme.bodyLarge!.copyWith(color: context.colorScheme.secondary,fontWeight: FontWeight.w700)
                            ),
                        TextSpan(
                            text: ' ${titlesecond}', // Texte traduit
                            style: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700)
                          ),
                        ]
                        
                    ],
                  ),
                ),
                
                  gapH20,
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ).animate().scale(delay: 50.milliseconds).fadeIn();
  }
}
