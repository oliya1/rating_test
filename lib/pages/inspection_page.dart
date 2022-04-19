import 'package:flutter/material.dart';
import '../custom_widgets/persian_text.dart';
import '../custom_widgets/rating_bar.dart';
import '../custom_widgets/my_globals.dart' as globals;

class InspectionPage extends StatelessWidget {
  final String? text;

  const InspectionPage({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int score1 = 0;
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
            NewRatingBar(icon: Icons.time_to_leave_rounded, name: 'لاستیک خودرو', weight: 10, score: 'score1'),
            // NewRatingBar(icon: Icons.handyman, name: 'چکش های اضطراری', weight: 2, score: 0),
            // NewRatingBar(icon: Icons.chair, name: 'روکش صندلی ها', weight: 1, score: 0),
            // NewRatingBar(icon: Icons.highlight, name: 'چراغ های خطر', weight: 6, score: 0),
            // NewRatingBar(icon: Icons.local_fire_department, name: 'سیستم گرمایشی', weight: 5, score: 0),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print(globals.score['score1']);
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

  void _showToast(BuildContext context, String txt) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text(txt),
      ),
    );
  }
}
