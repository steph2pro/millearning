// About Course Section
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
class AboutCourseSection extends StatelessWidget {
  final String description;
  final String tutorName;
  final String tutorRole;
  final String? tutorImageUrl;
  final Map<String, String> info;

  const AboutCourseSection({
    required this.description,
    required this.tutorName,
    required this.tutorRole,
     this.tutorImageUrl,
    required this.info,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Course",
          style: context.textTheme.titleMedium
        ),
        gapH10,
        Text(description),
        gapH20,
          Text(
          "Tutor",
          style: context.textTheme.titleMedium
        ),
        gapH10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Row(
            children: [ 
              tutorImageUrl != null
                  ? CircleAvatar(
                      radius: 25,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      backgroundImage: AssetImage(tutorImageUrl!),
                    )
                  :  CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.surface,
                          child: Icon(
                            Icons.person,
                            size: 25,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
            gapW12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tutorName, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(tutorRole),
              ],
            )
            ],
           ),
           Row(
            children: [
               Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.surface, // Fond bleu
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.phone, color: context.colorScheme.primary), // Icône blanche
                  onPressed: () {
                  },
                ),
              ),
              gapW10,
                Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.surface, // Fond bleu
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.message, color: context.colorScheme.primary), // Icône blanche
                  onPressed: () {
                  },
                ),
              ),
            ],
           )
          ],
        ),
        gapH20,
          Text(
          "Info",
          style: context.textTheme.titleMedium
        ),
        gapH10,
        ...info.entries.map(
          (entry) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(entry.key, style: TextStyle(color: Colors.grey)),
                Text(entry.value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
