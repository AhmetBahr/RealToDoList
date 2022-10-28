import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_to_do_list/presentation/pr/Models/Widgets/primary_color_option.dart';
import 'package:real_to_do_list/presentation/pr/Models/Widgets/switcher_container.dart';

import '../../../../Const/NewTheme/Theme_provider.dart';
import '../Styles/app_colors.dart';

class PrimaryColorSwitcher extends StatelessWidget {
  const PrimaryColorSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitcherContainer(
      title: 'Primary Color',
      content: Consumer<ThemeProvider>(
        builder: (c, themeProvider, _) {
          return Wrap(
            children: List.generate(
              AppColors.primaryColorOptions.length,
              (i) => PrimaryColorOption(
                color: AppColors.primaryColorOptions[i],
                isSelected: themeProvider.selectedPrimaryColor ==
                    AppColors.primaryColorOptions[i],
                onTap: () => themeProvider.setSelectedPrimaryColor(
                  AppColors.primaryColorOptions[i],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
