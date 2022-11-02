import 'package:flutter/material.dart';
import 'package:real_to_do_list/Const/routes.dart';

import '../../Pages/NotePage.dart';
import '../../Pages/SettingsPages/setting_pages.dart';
import '../../Pages/Old_ThemaPage.dart';
import '../../Pages/Theme_Settings_Page.dart';
import '../../Pages/login_view.dart';
import '../../utilities/dialogs/logout_dialog.dart';
import '../../services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({super.key});

  final padding = EdgeInsets.symmetric(horizontal: 10);

  final name = "Ahmet.B";
  final email = "randomMail@gmail.com";
  final urlImage = "das";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        // color: Colors.deepPurple[100],
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () {},
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
            const Divider(
              color: Colors.black,
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
            buildMenuItem(
                text: "Çıkış Yap",
                icon: Icons.logout,
                onClicked: () => selectedItem(context, 8)),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.amber,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  email,
                  style: TextStyle(fontSize: 15),
                )
              ],
            )
          ]),
        ),
      );

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

void selectedItem(BuildContext context, int index) async {
  Navigator.of(context).pop();
  switch (index) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => NotePage()));
      break;
    case 1:
      print("Presed 1");
      break;
    case 2:
      print("Presed 2");
      break;
    case 3:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SettingsPage()));
      break;
    case 4:
      print("Presed 4");
      break;
    case 5:
      print("Presed 5");
      break;
    case 6:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SettingsOnePage()));
      break;
    case 7:
      Navigator.of(context).pushNamed(loginRoute);
      break;
    case 8:
      final shouldLogOut = await showLogOutDialog(context);
      if (shouldLogOut){
        await AuthService.firebase().logOut();
        Navigator.of(context).pushNamed(loginRoute);
      }
      break;
  }
}


/*
 Navigator.of(context)
          .pushNamedAndRemoveUntil(loginRoute, (route) => false);
          */



 /*  Card(
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
*/
