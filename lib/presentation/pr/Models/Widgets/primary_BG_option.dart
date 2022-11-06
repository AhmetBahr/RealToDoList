import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_to_do_list/Const/NewTheme/Theme_provider.dart';
import 'package:real_to_do_list/presentation/pr/Models/Widgets/primary_color_option.dart';
import 'package:real_to_do_list/presentation/pr/Models/Widgets/switcher_container.dart';

import '../Styles/app_colors.dart';

class PrimaryBGSwitcher extends StatelessWidget {
  const PrimaryBGSwitcher({
    Key? key,
    required this.color,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        key: Key('__${color.value}_color_option__'),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? Theme.of(context).dividerColor
                : Colors.transparent,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: color,
          ),
        ),
      ),
    );
  }
}
