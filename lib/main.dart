import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // title: 'Give Star Reviews Example',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        toolbarHeight: 80,
        // toolbarOpacity: 0.6,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 8,
        title: Column(
          children: const [
            Text('راننده: سید حامد جعفری'),
            Text('پلاک: 72ب272ایران65'),
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
                      Text('لاستیک خودرو'),
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
                      Text('چکش های اضطراری'),
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
                      Text('روکش صندلی ها'),
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
                      Text('چراغ های خطر'),
                      Icon(Icons.highlight_outlined)
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
      ]),
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
