//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class shareButton extends StatelessWidget {
  static const customSwatch = MaterialColor(
    0xFFFF5252,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFF5252),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );
  const shareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Share Page"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Paylaş oglim'),
            SizedBox(
              height: 10,
            ),
            IconButton(
                onPressed: sharePressed,
                icon: Icon(
                  Icons.share,
                  color: Colors.redAccent,
                )),
          ],
        ),
      ),
    );
  }

  void sharePressed() {
    String message =
        'Agalar basıldığı zaman buradan yazı çıkıyor haberiniz ola. buraya link atılır';
    Share.share(message);
  }
}
