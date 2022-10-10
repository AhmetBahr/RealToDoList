import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({super.key});

  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.amberAccent,
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(
              height: 98,
            ),
            buildMenuItem(text: "Peoble", icon: Icons.people, onClicked: () {}),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
                text: "osman", icon: Icons.headset_rounded, onClicked: () {}),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(text: "Peoble", icon: Icons.people, onClicked: () {}),
            const SizedBox(
              height: 24,
            ),
            const Divider(
              //Çalışmıyor
              color: Colors.black,
            ),
            const SizedBox(
              height: 24,
            ),
            buildMenuItem(text: "Peoble", icon: Icons.people, onClicked: () {}),
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
    final color = Colors.white;
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
