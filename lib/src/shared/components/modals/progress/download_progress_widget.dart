import 'package:flutter/material.dart';

class DownloadProgressWidget extends StatelessWidget {
  final double progress;

  const DownloadProgressWidget({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(value: progress),
    );
  }
}
