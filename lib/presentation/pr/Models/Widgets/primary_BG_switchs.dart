import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_to_do_list/presentation/pr/Models/Widgets/primary_BG_option.dart';
import 'package:real_to_do_list/presentation/pr/Models/Widgets/primary_color_option.dart';
import 'package:real_to_do_list/presentation/pr/Models/Widgets/switcher_container.dart';

import '../../../../Const/NewTheme/Theme_provider.dart';
import '../Styles/app_colors.dart';

class PrimaryBGSwitcher extends StatelessWidget {
  const PrimaryBGSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitcherContainer(
      title: 'Primary Background',
      content: Consumer<ThemeProvider>(
        builder: (c, themeProvider, _) {
          return Wrap(
            children: List.generate(
              AppColors.primaryColorOptions.length,
              (i) => PrimaryBGOption(
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
