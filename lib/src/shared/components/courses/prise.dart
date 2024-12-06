// Price and Enroll Button Widget
import 'package:flutter/material.dart';
import 'package:millearnia/src/shared/components/buttons/button.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';
class PriceAndEnrollButton extends StatelessWidget {
  final double totalPrice;
  final VoidCallback? onPressed;

  const PriceAndEnrollButton({
    required this.totalPrice,
     this.onPressed,
     Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Total Price",
          style: context.textTheme.labelLarge
        ),
        Text(
          "\$$totalPrice",
          style: context.textTheme.titleSmall?.copyWith(color: context.colorScheme.primary)
        ),
      ]),
     
       SizedBox(
        width: 200,
        height: 50,
        child:   ElevatedButton(
          onPressed: onPressed,
          child: Text('Enroll Now'),
          
          style: ElevatedButton.styleFrom(
            backgroundColor: context.colorScheme.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
        )
        ,),
       
      ],
    );
  }
}