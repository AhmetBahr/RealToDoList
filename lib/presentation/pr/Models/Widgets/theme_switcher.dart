import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_to_do_list/Const/NewTheme/Theme_provider.dart';
import 'package:real_to_do_list/presentation/pr/Models/Widgets/selected_theme_indicator.dart';
import 'package:real_to_do_list/presentation/pr/Models/Widgets/switcher_container.dart';
import 'package:real_to_do_list/presentation/pr/Models/Widgets/theme_option.dart';

import '../Styles/app_themes.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double themeOptionIndicatorWidth =
        (MediaQuery.of(context).size.width - (20 * 4)) /
            AppThemes.appThemeOptions.length;

    double themeSwitcherOptionsHeight = 60;

    return SwitcherContainer(
      title: 'Theme',
      content: SizedBox(
        height: themeSwitcherOptionsHeight,
        child: Consumer<ThemeProvider>(
          builder: (c, themeProvider, _) {
            int selectedThemeIndex = AppThemes.appThemeOptions.indexWhere(
              (theme) => theme.mode == themeProvider.selectedThemeMode,
            );

            return Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SelectedThemeIndicator(
                  width: themeOptionIndicatorWidth,
                  selectedThemeIndex:
                      selectedThemeIndex >= 0 ? selectedThemeIndex : 0,
                ),
                Positioned.fill(
                  child: Row(
                    children: List.generate(
                      AppThemes.appThemeOptions.length,
                      (i) => ThemeOption(
                        key: Key(
                          '__${AppThemes.appThemeOptions[i].mode.name}_theme_option__',
                        ),
                        appTheme: AppThemes.appThemeOptions[i],
                        height: themeSwitcherOptionsHeight,
                        isSelected: selectedThemeIndex == i,
                        onTap: () => themeProvider.setSelectedThemeMode(
                          AppThemes.appThemeOptions[i].mode,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
