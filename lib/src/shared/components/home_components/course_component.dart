import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

class CourseComponent extends StatelessWidget {
  final String star;
  final String contentImage;
  final String title;
  final String? profilImage;
  final String name;
  final String prise;
  final String btnText;
  final VoidCallback? btnTap;

  const CourseComponent({
    Key? key,
    required this.title,
    required this.star,
  this.profilImage,
  required this.contentImage,
  required this.name,
  required this.prise,
  required this.btnText,
  this.btnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 218,
      // height: 216,
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.only(top: 5,left: 5),
      child: Column(
        children: [
          Stack(
            children: [
                 ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                contentImage,
                fit: BoxFit.cover,
                width: 213,
                height: 133,
              ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 11, left: 11),
                    padding: EdgeInsets.all(6),
                    // width: 62,
                    // height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      children: [
                        Icon(
                        Icons.star,
                        size: 24,
                        color: context.colorScheme.secondary,
                      ),
                      gapW10,
                      Text(
                      star,
                      style: context.textTheme.bodySmall!.copyWith(
                        fontSize: 14,
                        color: context.colorScheme.outline,
                      ),
                    ),

                      ],
                    )
                  ),
                  Container(
                     margin: EdgeInsets.only(top: 11, right: 11),
                    // width: 28,
                    height: 40,
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: Icon(
                        size: 24,
                        Icons.sync,
                        color: context.colorScheme.primary,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
          // Container(
          //   width: 62,
          //   height: 64,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: Theme.of(context).colorScheme.onInverseSurface,
          //   ),
            // child: 
           
          // ),
          gapH8,
          Text(
            title,
            style: context.textTheme.bodySmall!.copyWith(
              fontSize: 14,
              color: context.colorScheme.outline,
            ),
          ),
          gapH8,
          SizedBox(
            
              // width: 100,
              // height: 40,
              
            child: Row(
            children: [
              profilImage != null
                ? CircleAvatar(
                    radius: 10,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    backgroundImage: AssetImage(profilImage!),
                  )
                :  CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        child: Icon(
                          Icons.person,
                          size: 20,
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
          ),
          gapH8,
          Row(
            children: [
              Text(
                prise,
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  color: context.colorScheme.primaryContainer,
                ),
              ),
              gapW10,
             SizedBox(
              width: 100,
              height: 30,
              child:  ElevatedButton(
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  backgroundColor: context.colorScheme.onPrimaryContainer,
                ),
                child:   Text(
                btnText,
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  color: context.colorScheme.secondary,
                ),
                )
              ),
             )
            ],
          )
        ],
      ),
    );
  }
}
