import 'package:millearnia/src/shared/components/gap.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';



class ErrorToasWidget extends StatefulWidget {
  final String title;
  final Duration duration;
  final bool isSuccessCheck;
  const ErrorToasWidget({super.key, required this.title, required this.duration, this.isSuccessCheck = false});

  @override
  State<ErrorToasWidget> createState() => _ErrorToasWidgetState();
}

class _ErrorToasWidgetState extends State<ErrorToasWidget> {
  late Duration initialDuration = widget.duration;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      timer();
    });

    super.initState();
  }

  void timer() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        initialDuration -= const Duration(seconds: 1);
      });
      if (initialDuration > const Duration(seconds: 1)) {
        timer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Builder(builder: (context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: context.colorScheme.background, boxShadow: [
            BoxShadow(
              offset: const Offset(0, 12),
              blurRadius: 30,
              spreadRadius: 2,
              color: context.colorScheme.onBackground.withOpacity(.09),
            ),
            BoxShadow(
              offset: const Offset(0, .2),
              blurRadius: 30,
              spreadRadius: .4,
              color: context.colorScheme.background,
            )
          ]),
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Row(
            children: [
              widget.isSuccessCheck
                  ? Container(
                      height: 24,
                      width: 24,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colorScheme.error,
                      ),
                      child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(shape: BoxShape.circle, color: context.colorScheme.background.withOpacity(.4)),
                          child: Icon(
                            Icons.close,
                            size: 8,
                            color: context.colorScheme.background,
                          )),
                    )
                  : Container(
                      height: 24,
                      width: 24,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colorScheme.inverseSurface,
                      ),
                      child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(shape: BoxShape.circle, color: context.colorScheme.background.withOpacity(.4)),
                          child: Icon(
                            Icons.check,
                            size: 8,
                            color: context.colorScheme.background,
                          )),
                    ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                widget.title,
                style: context.textTheme.bodyLarge,
              )),
              SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  backgroundColor: context.colorScheme.primaryContainer,
                  color: context.colorScheme.primary,
                  strokeWidth: 3,
                  value: (1 - (initialDuration.inSeconds / widget.duration.inSeconds) * 1),
                ),
              ),
              const Gap.horizontal(width: 16),
            ],
          ),
        );
      }),
    );
  }
}