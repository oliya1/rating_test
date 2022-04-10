import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';

import '../utils/persian_text.dart';

class InspectionPage extends StatelessWidget {
  final String? text;
  const InspectionPage({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          // toolbarOpacity: 0.6,
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          elevation: 8,
          title: Column(
            children: [
              const PersianText(text: 'راننده: سید حامد جعفری'),
              PersianText(text: 'پلاک: ${text}'),
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
                padding: const EdgeInsets.all(16),
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
                        const Icon(Icons.time_to_leave_rounded),
                        const PersianText(text: 'لاستیک خودرو'),
                        StarRating(onChanged: (rate) {
                          _showToast(context, rate.toString());
                        }),
                      ],
                    ),
                    // Divider(height: 10),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.handyman),
                        const PersianText(text: 'چکش های اضطراری'),
                        StarRating(onChanged: (rate) {
                          _showToast(context, rate.toString());
                        }),
                      ],
                    ),
                    // Divider(height: 10),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.chair),
                        const PersianText(text: 'روکش صندلی ها'),
                        StarRating(onChanged: (rate) {
                          _showToast(context, rate.toString());
                        }),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.highlight_outlined),
                        const PersianText(text: 'چراغ های خطر'),
                        StarRating(onChanged: (rate) {
                          _showToast(context, rate.toString());
                        }),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.local_fire_department_outlined),
                        const PersianText(text: 'سیستم گرمایشی'),
                        StarRating(onChanged: (rate) {
                          _showToast(context, rate.toString());
                        }),
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
