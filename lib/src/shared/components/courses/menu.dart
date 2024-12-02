import 'package:flutter/material.dart';
import 'package:millearnia/src/core/theme/app_size.dart';
import 'package:millearnia/src/shared/extensions/context_extensions.dart';

class Menu extends StatefulWidget {
  final List<String> items;
  final ValueChanged<int> onItemSelected;

  const Menu({
    Key? key,
    required this.items,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.items.length, (index) {
        final isSelected = _selectedIndex == index;
        return GestureDetector(
          onTap: () => _onTap(index),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.items[index],
                style: context.textTheme.titleSmall!.copyWith(
                color: isSelected ? context.colorScheme.primary : context.colorScheme.outline,
                )
              ),
              gapH10,
              if (isSelected)
                Container(
                  height: 5,
                  width: 90,
                  color: context.colorScheme.primary,
                //  decoration: BoxDecoration(
                //   color: Colors.blue,
                //   borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(2), // Bordure gauche-haute
                //     topRight: Radius.circular(2), // Bordure droite-haute
                //   ),
                // ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
