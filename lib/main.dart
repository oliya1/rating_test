import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:rating_test/pages/home_page.dart';
import 'package:rating_test/custom_widgets/persian_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale("fa", "IR") ,// OR Locale('ar', 'AE') OR Other RTL locales,
      // debugShowCheckedModeBanner: false,
      // title: 'Give Star Reviews Example',
      home: HomePage(),
    );
  }
}
