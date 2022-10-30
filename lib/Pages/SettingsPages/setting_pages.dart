import 'package:flutter/material.dart';
import 'package:real_to_do_list/Pages/Old_ThemaPage.dart';

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
          SizedBox(
            height: 25,
          ),
          Text1(),
          Divider(),
          SizedBox(
            height: 5,
          ),
          Hesap_Ayarlari(),
          uygulama_Ayarlari(),
          ThemePage(),
          Gorev_Zili(),
          tarih_saat(),
          SizedBox(
            height: 8,
          ),
          Text2(),
          Divider(),
          SizedBox(
            height: 8,
          ),
          Dil(),
          Degerlendir(),
          paylas(),
          G_bildirim(),
          hakkinda(),
          surum(),
        ],
      )),
    );
  }
}

Widget Text1() => Container(
      child: Text(
        "    Özelleştir",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );

Widget Text2() => Container(
      child: Text(
        "    Hakkında",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );

Widget Text3() => Container(
      child: Text(
        "    Morning",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );

Widget Hesap_Ayarlari() => Container(
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      // color: Colors.grey,
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

Widget Gorev_Zili() => Container(
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      // color: Colors.grey,
      child: ListTile(
        onTap: () {},
        title: Text(
          "Görev Zili",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Icon(Icons.phonelink_ring),
        //trailing: Icon(Icons.edit),
      ),
    );

Widget Dil() => Container(
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      // color: Colors.grey,
      child: ListTile(
        onTap: () {},
        title: Text(
          "Dil",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Icon(Icons.public_rounded),
        //trailing: Icon(Icons.edit),
      ),
    );

Widget Degerlendir() => Container(
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      // color: Colors.grey,
      child: ListTile(
        onTap: () {},
        title: Text(
          "Değerlendir",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Icon(Icons.star_half_outlined),
        //trailing: Icon(Icons.edit),
      ),
    );

Widget ThemePage() => Container(
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      // color: Colors.grey,
      child: ListTile(
        onTap: () {
          //  Navigator.pushNamed(themeaPagee);
        },
        title: Text(
          "Tema",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Icon(Icons.brush_outlined),
        //trailing: Icon(Icons.edit),
      ),
    );

Widget uygulama_Ayarlari() => Container(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      // color: Colors.grey,
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

Widget tarih_saat() => Container(
      //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      //color: Colors.grey,
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

Widget paylas() => Container(
      //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      //color: Colors.grey,
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
Widget G_bildirim() => Container(
      //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      // color: Colors.grey,
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
Widget surum() => Container(
      //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      // color: Colors.grey,
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
Widget hakkinda() => Container(
      //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.only(
        right: 5.0,
        left: 5.0,
        top: 5.0,
      ),
      // color: Colors.grey,
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
