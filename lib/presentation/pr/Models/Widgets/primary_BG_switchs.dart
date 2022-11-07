import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_to_do_list/Pages/AnonNotePage.dart';
import 'package:real_to_do_list/presentation/pr/Models/Widgets/primary_color_option.dart';
import 'package:real_to_do_list/presentation/pr/Models/Widgets/switcher_container.dart';
import 'package:real_to_do_list/services/crud/notes_service.dart';
import 'package:real_to_do_list/storage/service_locator.dart';

import '../../../../Const/NewTheme/Theme_provider.dart';
import '../Styles/app_colors.dart';
import 'package:real_to_do_list/Pages/NotePage.dart';
import 'package:real_to_do_list/storage/storage_service.dart';
import 'package:real_to_do_list/Const/routes.dart';

class PrimaryBGSwitcher extends StatelessWidget {
  const PrimaryBGSwitcher({Key? key}) : super(key: key);

  final String primaryBG1 = "asset/svg/unlem.png";
  final String primaryBG2 = "asset/svg/undraw_Annotation_re_h774.png";
  final String primaryBG3 = "asset/svg/undraw_Accept_request_re_d81h.png";
  final String primaryBG4 = "asset/svg/pexels-photo-13866617.jpeg";

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(20),
      child: Container(
        height: 450,
        color: Colors.amber,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "  To Do List",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                card2(context),
                card3(context),
              ],
            ),
            Row(
              children: [
                card2(context),
                card3(context),
              ],
            ),
            Row(
              children: [
                card2(context),
                card3(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final StorageService storageService = getIt<StorageService>();
Widget card2(context) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(14),
      color: Colors.blue,
      child: new InkWell(
        onTap: () {
          storageService.set("bg", "asset/svg/unlem.png");
          print("tapped");
          Navigator.pop(context); // pop current page
          Navigator.of(context).pushNamed(anonNotesRoute); // push it back in
        },
        child: Container(
          width: 150.0,
          height: 100.0,
        ),
      ),
    );

Widget card3(context) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(10),
      color: Colors.blue,
      child: new InkWell(
        onTap: () {
          storageService.set("bg", "asset/svg/undraw_Annotation_re_h774.png");
          print("tapped");
          Navigator.pop(context); // pop current page
          Navigator.of(context).pushNamed(anonNotesRoute); // push it back in
        },
        child: Container(
          width: 150.0,
          height: 100.0,
        ),
      ),
    );

Widget card4(context) => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(10),
      color: Colors.blue,
      child: new InkWell(
        onTap: () {
          storageService.set(
              "bg", "asset/svg/undraw_Accept_request_re_d81h.png");
          print("tapped");
          Navigator.pop(context); // pop current page
          Navigator.of(context).pushNamed(anonNotesRoute); // push it back in
        },
        child: Container(
          width: 75.0,
          height: 75.0,
        ),
      ),
    );

Widget card5(context) => Card(
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