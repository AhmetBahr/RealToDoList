import 'package:flutter/material.dart';

  class SettingsOnePage extends StatelessWidget {
  static final String path ="lib/Pages/SettingsPages/settings_pages.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Divider(),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              //margin: const EdgeInsets.all(40.0),
              margin: const EdgeInsets.only(right: 40.0,left: 40.0,top: 40.0,),
              
              color: Colors.grey,
              child: ListTile(
                onTap:() {},
                title: Text("Temalar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,),),
                leading: Icon(Icons.brush),
                //trailing: Icon(Icons.edit),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              margin: const EdgeInsets.only(right: 40.0,left: 40.0,bottom:2.0, top:5.0,),
              color: Colors.grey,
              child: ListTile(
                onTap:() {},
                title: Text("Hesap Ayarları", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,),),
                leading: Icon(Icons.person),
                //trailing: Icon(Icons.edit),
              ),
            ),
             Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              margin: const EdgeInsets.only(right: 40.0,left: 40.0,bottom:2.0, top:5.0,),
              color: Colors.grey,
              child: ListTile(
                onTap:() {},
                title: Text("Uygulama Ayarları", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,),),
                leading: Icon(Icons.settings_applications),
                //trailing: Icon(Icons.edit),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              margin: const EdgeInsets.only(right: 40.0,left: 40.0,bottom:2.0, top:5.0,),
              color: Colors.grey,
              child: ListTile(
                onTap:() {},
                title: Text("Tarih ve Saat", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,),),
                leading: Icon(Icons.calendar_month),
                //trailing: Icon(Icons.edit),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              margin: const EdgeInsets.only(right: 40.0,left: 40.0,bottom:2.0, top:5.0,),
              color: Colors.grey,
              child: ListTile(
                onTap:() {},
                title: Text("Paylaş", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,),),
                leading: Icon(Icons.share),
                //trailing: Icon(Icons.edit),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              margin: const EdgeInsets.only(right: 40.0,left: 40.0,bottom:2.0, top:5.0,),
              color: Colors.grey,
              child: ListTile(
                onTap:() {},
                title: Text("Geri Bildirim", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,),),
                leading: Icon(Icons.reviews),
                //trailing: Icon(Icons.edit),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              margin: const EdgeInsets.only(right: 40.0,left: 40.0,bottom:2.0, top:5.0,),
              color: Colors.grey,
              child: ListTile(
                onTap:() {},
                title: Text("Sürüm", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,),),
                leading: Icon(Icons.settings_applications),
                //trailing: Icon(Icons.edit),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              margin: const EdgeInsets.only(right: 40.0,left: 40.0,bottom:2.0, top:5.0,),
              color: Colors.grey,
              child: ListTile(
                onTap:() {},
                title: Text("Hakkında", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,),),
                leading: Icon(Icons.drag_handle),
                //trailing: Icon(Icons.edit),
              ),
            ),
          ],
        )
      ),
    );
  }
}