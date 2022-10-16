import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({super.key});

  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.blueGrey[100],
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsetsDirectional.all(1),
              color: Colors.grey.shade800,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(2),
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.grey.shade800, width: 5),
                      /*   image: DecorationImage(
                          image: ),*/
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: Colors.black,
            ),
            buildMenuItem(
                text: "Pro",
                icon: Icons.account_balance_rounded,
                onClicked: () {}),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: "Yıldızlı Görevler",
                icon: Icons.star_rounded,
                onClicked: () {}),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: "Kategori", icon: Icons.category, onClicked: () {}),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: "Tema",
                icon: Icons.brightness_medium_sharp,
                onClicked: () {}),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: "Bağış", icon: Icons.favorite, onClicked: () {}),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: "Geri Bildirim",
                icon: Icons.border_color_outlined,
                onClicked: () {}),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: "Ayarlar",
                icon: Icons.settings_rounded,
                onClicked: () {}),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
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
      onTap: () {},
    );
  }
}
