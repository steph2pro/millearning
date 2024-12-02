// Course Tabs Widget
import 'package:flutter/material.dart';
import 'package:millearnia/src/shared/components/courses/tabs_item.dart';
class CourseTabs extends StatelessWidget {
  const CourseTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  [
        TabItem(label: "About", isSelected: true),
        TabItem(label: "Lessons", isSelected: false),
        TabItem(label: "Reviews", isSelected: false),
      ],
    );
  }
}
