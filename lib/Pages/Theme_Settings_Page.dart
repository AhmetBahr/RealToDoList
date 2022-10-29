import 'package:flutter/material.dart';

import '../presentation/pr/Models/Widgets/page_wrapper.dart';
import '../presentation/pr/Models/Widgets/primary_BG_switchs.dart';
import '../presentation/pr/Models/Widgets/primary_color_switchs.dart';
import '../presentation/pr/Models/Widgets/theme_switcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: PageWrapper(
        body: ListView(
          children: const [
            SizedBox(height: 30),
            ThemeSwitcher(),
            SizedBox(height: 20),
            PrimaryColorSwitcher(),
            SizedBox(height: 20),
            PrimaryBGSwitcher(),
          ],
        ),
      ),
    );
  }
}
