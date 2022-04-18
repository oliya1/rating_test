import 'package:flutter/material.dart';
import '../custom_widgets/persian_text.dart';
import '../custom_widgets/rating_bar.dart';

class InspectionPage extends StatelessWidget {
  final String? text;

  const InspectionPage({Key? key, this.text}) : super(key: key);

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
            const PersianText(text: 'راننده: سید حامد جعفری'),
            PersianText(text: 'پلاک: ${text}'),
          ],
        ),

        // Container(
        //   padding: EdgeInsets.all(8),
        //   child:
        // )
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          // padding: EdgeInsets.fromLTRB(3, 12, 3, 20),
          children: const <Widget>[
            NewRatingBar(icon: Icons.time_to_leave_rounded, name: 'لاستیک خودرو', weight: 10),
            NewRatingBar(icon: Icons.handyman, name: 'چکش های اضطراری', weight: 2),
            NewRatingBar(icon: Icons.chair, name: 'روکش صندلی ها', weight: 1),
            NewRatingBar(icon: Icons.highlight, name: 'چراغ های خطر', weight: 6),
            NewRatingBar(icon: Icons.local_fire_department, name: 'سیستم گرمایشی', weight: 5)
          ],
        ),
      ),

      // SafeArea(
      //   child: Builder(
      //     builder: (context) => Container(
      //         padding: const EdgeInsets.all(16),
      //         child: Column(
      //           children: <Widget>[
      //             // StarRating(onChanged: (rate) {
      //             //   _showToast(context, rate.toString());
      //             // }),
      //             // Divider(height: 10),
      //             // GiveStarReviews(
      //             //   starData: [
      //             //     GiveStarData(
      //             //         text: 'Review 1',
      //             //         onChanged: (rate) {
      //             //           _showToast(context, rate.toString());
      //             //         }),
      //             //     GiveStarData(
      //             //         text: 'Review 2',
      //             //         onChanged: (rate) {
      //             //           _showToast(context, rate.toString());
      //             //         }),
      //             //     GiveStarData(
      //             //         text: 'Review 3',
      //             //         onChanged: (rate) {
      //             //           _showToast(context, rate.toString());
      //             //         }),
      //             //   ],
      //             // ),
      //             // SizedBox(height: 24),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 const Icon(Icons.time_to_leave_rounded),
      //                 const PersianText(text: 'لاستیک خودرو'),
      //                 StarRating(onChanged: (rate) {
      //                   _showToast(context, rate.toString());
      //                 }),
      //               ],
      //             ),
      //             // Divider(height: 10),
      //             const SizedBox(height: 10),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 const Icon(Icons.handyman),
      //                 const PersianText(text: 'چکش های اضطراری'),
      //                 StarRating(onChanged: (rate) {
      //                   _showToast(context, rate.toString());
      //                 }),
      //               ],
      //             ),
      //             // Divider(height: 10),
      //             const SizedBox(height: 10),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 const Icon(Icons.chair),
      //                 const PersianText(text: 'روکش صندلی ها'),
      //                 StarRating(onChanged: (rate) {
      //                   _showToast(context, rate.toString());
      //                 }),
      //               ],
      //             ),
      //             const SizedBox(height: 10),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 const Icon(Icons.highlight_outlined),
      //                 const PersianText(text: 'چراغ های خطر'),
      //                 StarRating(onChanged: (rate) {
      //                   _showToast(context, rate.toString());
      //                 }),
      //               ],
      //             ),
      //             const SizedBox(height: 10),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 const Icon(Icons.local_fire_department_outlined),
      //                 const PersianText(text: 'سیستم گرمایشی'),
      //                 StarRating(onChanged: (rate) {
      //                   _showToast(context, rate.toString());
      //                 }),
      //               ],
      //             )
      //           ],
      //         )),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
