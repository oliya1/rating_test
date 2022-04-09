import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rating_test/utils/persian_text.dart';
import 'package:textfield_search/textfield_search.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final label = "Some Label";
  final dummyList = ['72ب272', '52س272'];
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        // toolbarOpacity: 0.6,
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        elevation: 8,
        title: PersianText(text: 'امور ایمنی شرکت ملی صنایع مس ایران', fontSize: 21,)

        // Container(
        //   padding: EdgeInsets.all(8),
        //   child:
        // )
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        child:
        TextFieldSearch(
          initialList: dummyList,
          label: label,
          controller: myController,

          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintTextDirection: TextDirection.rtl,
            hintText: 'لطفا قسمتی از پلاک را وارد نمایید'
          ),
        )
        // TextField(
        //   textDirection: TextDirection.rtl,
        //   decoration: InputDecoration(
        //     border: OutlineInputBorder(),
        //     hintTextDirection: TextDirection.rtl,
        //     hintText: 'لطفا قسمتی از پلاک را وارد نمایید'
        //   ),
        // ),
      ),
    );
  }
}
