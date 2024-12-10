import 'package:flutter/material.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

class DownloadProgressWidget extends StatelessWidget {
  final double progress;

  const DownloadProgressWidget({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(progress.toString()),
        Center(
          child: CircularProgressIndicator(
            value: progress,
            color: context.colorScheme.primary
              ),
        )
    ],
    );
  }
}
