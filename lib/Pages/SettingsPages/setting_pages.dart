import 'package:flutter/material.dart';

class SettingsOnePage extends StatelessWidget {
  static final String path = "lib/Pages/SettingsPages/settings_pages.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          'Ayarlar',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hesap_Ayarlari(),
          uygulama_Ayarlari(),
          tarih_saat(),
          paylas(),
          G_bildirim(),
          surum(),
          hakkinda(),
        ],
      )),
    );
  }
}

Widget Hesap_Ayarlari() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      color: Colors.grey,
      child: ListTile(
        onTap: () {},
        title: Text(
          "Hesap Ayarları",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Icon(Icons.person),
        //trailing: Icon(Icons.edit),
      ),
    );

Widget uygulama_Ayarlari() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      color: Colors.grey,
      child: ListTile(
        onTap: () {},
        title: Text(
          "Uygulama Ayarları",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Icon(Icons.settings_applications),
        //trailing: Icon(Icons.edit),
      ),
    );

Widget tarih_saat() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      color: Colors.grey,
      child: ListTile(
        onTap: () {},
        title: Text(
          "Tarih ve Saat",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Icon(Icons.calendar_month),
        //trailing: Icon(Icons.edit),
      ),
    );

Widget paylas() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      color: Colors.grey,
      child: ListTile(
        onTap: () {},
        title: Text(
          "Paylaş",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Icon(Icons.share),
        //trailing: Icon(Icons.edit),
      ),
    );
Widget G_bildirim() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      color: Colors.grey,
      child: ListTile(
        onTap: () {},
        title: Text(
          "Geri Bildirim",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Icon(Icons.reviews),
        //trailing: Icon(Icons.edit),
      ),
    );
Widget surum() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      color: Colors.grey,
      child: ListTile(
        onTap: () {},
        title: Text(
          "Sürüm",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Icon(Icons.settings_applications),
        //trailing: Icon(Icons.edit),
      ),
    );
Widget hakkinda() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      color: Colors.grey,
      child: ListTile(
        onTap: () {},
        title: Text(
          "Hakkında",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Icon(Icons.drag_handle),
        //trailing: Icon(Icons.edit),
      ),
    );
