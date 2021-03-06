import 'dart:ffi';
import 'dart:convert';

import 'package:flutter/material.dart';
import '../custom_widgets/persian_text.dart';
import '../custom_widgets/rating_bar.dart';

class InspectionPage extends StatelessWidget {
  final String? text;
  var s1 = [0,0,0,0,0];
  double avg = 0;

  InspectionPage({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        // toolbarOpacity: 0.6,
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        elevation: 8,
        title: Column(
          children: [
            PersianText(text: 'راننده: سید حامد جعفری'),
            PersianText(text: 'پلاک: ${text}'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            NewRatingBar(icon: Icons.time_to_leave_rounded, name: 'لاستیک خودرو', weight: 10, score: 0, callback: (x){
              s1[0] = x*10;
              avrage(context);
            }),
            NewRatingBar(icon: Icons.handyman, name: 'چکش های اضطراری', weight: 2, score: 0, callback: (x){
              s1[1] = x*2;
              avrage(context);
            }),
            NewRatingBar(icon: Icons.chair, name: 'روکش صندلی', weight: 1, score: 0, callback: (x) {
              s1[2] = x*1;
              avrage(context);
            }),
            NewRatingBar(icon: Icons.highlight, name: 'چراغ های خطر', weight: 6, score: 0, callback: (x) {
              s1[3] = x*6;
              avrage(context);
            }),
            NewRatingBar(icon: Icons.local_fire_department, name: 'سیستم گرمایشی', weight: 5, score: 0, callback: (x) {
              s1[4] = x*5;
              avrage(context);
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showToast(context, 'بازرسی پلاک: ${text} با نمره ${avg.toStringAsFixed(2)} ثبت شد.', 10000);
            Navigator.pop(context);
          },
          backgroundColor: Colors.green,
          tooltip: 'ذخیره',
          child: const Icon(Icons.save_outlined),
        ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.cancel_outlined),
      //       label: 'انصراف',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.save_outlined),
      //       label: 'ذخیره',
      //     ),
      //   ],
      // ),
    );
  }

  void _showToast(BuildContext context, String txt, int milliseconds) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: milliseconds),
        content: Text(txt),
      ),
    );

  }
  void avrage(BuildContext context){
    int _sum = 0;
    for (var i in s1) {
      _sum += i;
    }
    avg = _sum/24;
    _showToast(context, 'میانگین: ${avg.toStringAsFixed(2)}', 1500);
  }
}
