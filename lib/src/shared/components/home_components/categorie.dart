import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/components/string_extionsions.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

class Categorie extends StatelessWidget {
  final String title;
  final String? contentImage;
  final Icon? icon;

  const Categorie({
    Key? key,
    required this.title,
    this.contentImage,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 89,
      height: 94,
      margin: EdgeInsets.all(1),
      child: Column(
        children: [
          Container(
            width: 62,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
            child: contentImage != null
                ? CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                    backgroundImage: NetworkImage(contentImage!),
                  )
                : (icon != null
                    ? CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
                        child: Icon(
                          icon?.icon,
                          size: 24,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      )
                    : Container()),
          ),
          gapH8,
          Text(
            title.capitalize().truncateWithEllipsis(15),
            style: context.textTheme.bodySmall!.copyWith(
              fontSize: 12,
              color: context.colorScheme.tertiary,
              
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
