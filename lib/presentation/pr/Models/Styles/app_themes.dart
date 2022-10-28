import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_to_do_list/presentation/pr/models/app_theme.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData main({
    bool isDark = false,
    Color primaryColor = AppColors.primary,
  }) {
    return ThemeData(
      fontFamily: 'TitilliumWeb',
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: isDark ? AppColors.black : AppColors.gray,
      cardColor: isDark ? AppColors.blackLight : AppColors.white,
      dividerColor: isDark
          ? AppColors.white.withOpacity(0.2)
          : AppColors.black.withOpacity(0.1),
      shadowColor: isDark ? AppColors.text : AppColors.grayDark,
      primarySwatch: AppColors.getMaterialColorFromColor(primaryColor),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: primaryColor,
        systemOverlayStyle:
            isDark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      ),
    );
  }

  static List<AppTheme> appThemeOptions = [
    AppTheme(
      mode: ThemeMode.light,
      title: 'Light',
      icon: Icons.brightness_5_rounded,
    ),
    AppTheme(
      mode: ThemeMode.dark,
      title: 'Dark',
      icon: Icons.brightness_2_rounded,
    ),
    AppTheme(
      mode: ThemeMode.system,
      title: 'System',
      icon: Icons.brightness_4_rounded,
    ),
  ];
}
