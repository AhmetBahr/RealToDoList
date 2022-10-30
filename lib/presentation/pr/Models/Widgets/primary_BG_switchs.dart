import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_to_do_list/presentation/pr/Models/Widgets/primary_BG_option.dart';
import 'package:real_to_do_list/presentation/pr/Models/Widgets/primary_color_option.dart';
import 'package:real_to_do_list/presentation/pr/Models/Widgets/switcher_container.dart';

import '../../../../Const/NewTheme/Theme_provider.dart';
import '../Styles/app_colors.dart';

class PrimaryBGSwitcher extends StatelessWidget {
  const PrimaryBGSwitcher({Key? key}) : super(key: key);

  final String primaryBG1 = "asset/svg/unlem.png";
  final String primaryBG2 = "asset/svg/undraw_Annotation_re_h774.png";
  final String primaryBG3 = "asset/svg/undraw_Accept_request_re_d81h.png";
  final String primaryBG4 = "asset/svg/pexels-photo-13866617.jpeg";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        card2(),
        card3(),
        card4(),
        card5(),
      ],
    );
  }
}

Widget card2() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(10),
      color: Colors.blue,
      child: new InkWell(
        onTap: () {
          print("tapped");
        },
        child: Container(
          width: 75.0,
          height: 75.0,
        ),
      ),
    );

Widget card3() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(10),
      color: Colors.blue,
      child: new InkWell(
        onTap: () {
          print("tapped");
        },
        child: Container(
          width: 75.0,
          height: 75.0,
        ),
      ),
    );

Widget card4() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(10),
      color: Colors.blue,
      child: new InkWell(
        onTap: () {
          print("tapped");
        },
        child: Container(
          width: 75.0,
          height: 75.0,
        ),
      ),
    );

Widget card5() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(10),
      color: Colors.blue,
      child: new InkWell(
        onTap: () {
          print("tapped");
        },
        child: Container(
          width: 75.0,
          height: 75.0,
        ),
      ),
    );



/*

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

  */