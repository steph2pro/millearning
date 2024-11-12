// Drawing a divider with some text in the center
import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/dimens.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

class LabeledDivider extends StatelessWidget {
  final String label;
  final EdgeInsetsGeometry labelPadding;
  final Color? labelBackgroundColor;
  final Alignment labelAlignment;

  const LabeledDivider({
    required this.label,
    this.labelPadding = const EdgeInsets.symmetric(horizontal: Dimens.spacing),
    super.key,
    this.labelBackgroundColor,
    this.labelAlignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: labelAlignment,
      children: [
         Divider(
          color:  context.colorScheme.onInverseSurface,
          thickness: 1,
          
        ),
        Container(
          padding: labelPadding,
          color: labelBackgroundColor ?? context.colorScheme.surface,
          child: Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onInverseSurface,fontSize: 12),
          ),
        )
      ],
    );
  }
}
