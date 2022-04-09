import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:rating_test/pages/home_page.dart';
import 'package:rating_test/utils/persian_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: Locale("fa", "IR") ,// OR Locale('ar', 'AE') OR Other RTL locales,
      // debugShowCheckedModeBanner: false,
      // title: 'Give Star Reviews Example',
      home: HomePage(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        // toolbarOpacity: 0.6,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 8,
        title: Column(
          children: const [
            PersianText(text: 'راننده: سید حامد جعفری'),
            PersianText(text: 'پلاک: 72ب272ایران65'),
          ],
        ),

        // Container(
        //   padding: EdgeInsets.all(8),
        //   child:
        // )
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) => Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  // StarRating(onChanged: (rate) {
                  //   _showToast(context, rate.toString());
                  // }),
                  // Divider(height: 10),
                  // GiveStarReviews(
                  //   starData: [
                  //     GiveStarData(
                  //         text: 'Review 1',
                  //         onChanged: (rate) {
                  //           _showToast(context, rate.toString());
                  //         }),
                  //     GiveStarData(
                  //         text: 'Review 2',
                  //         onChanged: (rate) {
                  //           _showToast(context, rate.toString());
                  //         }),
                  //     GiveStarData(
                  //         text: 'Review 3',
                  //         onChanged: (rate) {
                  //           _showToast(context, rate.toString());
                  //         }),
                  //   ],
                  // ),
                  // SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StarRating(onChanged: (rate) {
                        _showToast(context, rate.toString());
                      }),
                      PersianText(text: 'لاستیک خودرو'),
                      Icon(Icons.time_to_leave_rounded)
                    ],
                  ),
                  // Divider(height: 10),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StarRating(onChanged: (rate) {
                        _showToast(context, rate.toString());
                      }),
                      PersianText(text: 'چکش های اضطراری'),
                      Icon(Icons.handyman)
                    ],
                  ),
                  // Divider(height: 10),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StarRating(onChanged: (rate) {
                        _showToast(context, rate.toString());
                      }),
                      PersianText(text: 'روکش صندلی ها'),
                      Icon(Icons.chair)
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StarRating(onChanged: (rate) {
                        _showToast(context, rate.toString());
                      }),
                      PersianText(text: 'چراغ های خطر'),
                      Icon(Icons.highlight_outlined)
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StarRating(onChanged: (rate) {
                        _showToast(context, rate.toString());
                      }),
                      PersianText(text: 'سیستم گرمایشی'),
                      Icon(Icons.local_fire_department_outlined)
                    ],
                  )
                ],
              )),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.cancel_outlined),
          label: 'انصراف',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.save_outlined),
          label: 'ذخیره',
        ),
      ],
      ),
    );
  }

  void _showToast(BuildContext context, String txt) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text(txt),
      ),
    );
  }
}
