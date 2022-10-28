import 'package:flutter/material.dart';
import 'package:real_to_do_list/Const/routes.dart';

import '../../Pages/NotePage.dart';
import '../../Pages/SettingsPages/setting_pages.dart';
import '../../Pages/Old_ThemaPage.dart';
import '../../Pages/Theme_Settings_Page.dart';
import '../../Pages/login_view.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({super.key});

  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.deepPurple[100],
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsetsDirectional.all(1),
              color: Colors.grey.shade800,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        margin: EdgeInsets.all(2),
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          shape: BoxShape.rectangle,
                          border:
                              Border.all(color: Colors.grey.shade800, width: 1),
                          image: DecorationImage(
                            image: AssetImage(
                                "asset/svg/undraw_Problem_solving_re_4gq3 kopya.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 16,
                        right: 16,
                        left: 16,
                        child: Text(
                          "To Do List",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
//      ---------------0---------------

            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: Colors.black,
            ),
            buildMenuItem(
              text: "Pro",
              icon: Icons.account_balance_rounded,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(
              height: 5,
            ),

            buildMenuItem(
                text: "Yıldızlı Görevler",
                icon: Icons.star_rounded,
                onClicked: () => selectedItem(context, 1)),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: "Kategori",
                icon: Icons.category,
                onClicked: () => selectedItem(context, 2)),
            const SizedBox(
              height: 16,
            ),
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: "Tema",
                icon: Icons.brightness_medium_sharp,
                onClicked: () => selectedItem(context, 3)),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: "Bağış",
                icon: Icons.favorite,
                onClicked: () => selectedItem(context, 4)),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: "Geri Bildirim",
                icon: Icons.border_color_outlined,
                onClicked: () => selectedItem(context, 5)),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: "Ayarlar",
                icon: Icons.settings_rounded,
                onClicked: () => selectedItem(context, 6)),
            buildMenuItem(
                text: "Profile",
                icon: Icons.people_alt_rounded,
                onClicked: () => selectedItem(context, 7)),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    onClicked, //voidCallBack? onClicked  anlamadım düzeldi
  }) {
    final color = Colors.grey[700];
    final hoverColor = Colors.white;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder:
            (context) => /* BURAYA GIDILCEK SAYFA */ NotePage(), //Bu deneme için kondu
      ));
      break;
    case 1:
      print("Presed 1");
      break;
    case 2:
      print("Presed 2");
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SettingsPage(),
      ));

      break;
    case 4:
      print("Presed 4");
      break;
    case 5:
      print("Presed 5");
      break;
    case 6:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SettingsOnePage(),
      ));

      break;
    case 7:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoginView(),
      ));
      break;
  }
}


/*
 Navigator.of(context)
          .pushNamedAndRemoveUntil(loginRoute, (route) => false);
          */