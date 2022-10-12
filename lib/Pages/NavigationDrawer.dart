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
              height: 240,
            ),
            buildMenuItem(text: "1", icon: Icons.people, onClicked: () {}),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(text: "2", icon: Icons.favorite, onClicked: () {}),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
                text: "3", icon: Icons.back_hand_rounded, onClicked: () {}),
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
            buildMenuItem(text: "4", icon: Icons.add_alarm, onClicked: () {}),
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
    final color = Colors.black;
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
