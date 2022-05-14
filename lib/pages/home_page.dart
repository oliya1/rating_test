import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_test/custom_widgets/persian_text.dart';
import 'package:rating_test/pages/inspection_page.dart';
import 'package:textfield_search/textfield_search.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final label = "Some Label";
  final dummyList = ['72ب272ایران65', '52س272ایران45', '65ل265ایران12'];
  Widget _widget = const Text('');
  TextEditingController myController = TextEditingController();

  Future<List> fetchComplexData() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    List _list = <dynamic>[];
    List _jsonList = [
      {'label': '72ب272ایران65', 'value': 30},
      {'label': '52س272ایران45', 'value': 31},
      {'label': '65ل265ایران12', 'value': 32},
    ];
    // create a list from the text input of three items
    // to mock a list of items from an http call where
    // the label is what is seen in the textfield and something like an
    // ID is the selected value
    _list.add(new TestItem.fromJson(_jsonList[0]));
    _list.add(new TestItem.fromJson(_jsonList[1]));
    _list.add(new TestItem.fromJson(_jsonList[2]));

    return _list;
  }

  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 60,
          // toolbarOpacity: 0.6,
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          elevation: 8,
          title: const PersianText(
            text: 'امور ایمنی، بهداشت و محیط زیست مجتمع مس سرچشمه',
            fontSize: 15,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              padding: const EdgeInsets.all(8),
              child: DropdownButtonFormField<String>(
                // value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                decoration: const InputDecoration(
                  hintText: 'لطفا نوع خودرو را انتخاب نمایید',
                  border: OutlineInputBorder(),
                ),
                elevation: 8,
                style: const TextStyle(color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  'خودرو سبک',
                  'خودرو نیمه سنگین',
                  'تانکرهای حمل اسید'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                padding: const EdgeInsets.all(8),
                child: TextFieldSearch(
                  label: 'Complex Future List',
                  controller: myController,
                  future: () {
                    return fetchComplexData();
                  },
                  minStringLength: 2,
                  textStyle: const TextStyle(color: Colors.red),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // hintTextDirection: TextDirection.rtl,
                      hintText: 'لطفا قسمتی از پلاک را وارد نمایید'),
                  getSelectedValue: (item) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          actionsAlignment: MainAxisAlignment.spaceEvenly,
                          content: setCard(),
                          actions: <Widget>[

                            TextButton(
                              onPressed: () => Navigator.pop(context, 1),
                              child: const Text('تایید'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 0);
                              },
                              child: const Text('اقدام مجدد'),
                            ),
                          ],
                        )).then((value) => {
                      FocusScope.of(context).nextFocus(),

                      if (value != null)
                        {
                          if (value == 0)
                            {myController.text = ''}
                          else
                            {
                              setState(() {
                                _widget = setTable();
                              })
                            },
                        }
                    });

                    // setState(() {
                    //   _widget = setCard();
                    // });
                  },
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              padding: const EdgeInsets.all(8),
              child: _widget,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'ثبت بازرسی فنی',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh),
            label: 'ورود مجدد اطلاعات',
          ),
        ],
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.deepOrange,
        onTap: toDo,
        // currentIndex: 0,
        // type: BottomNavigationBarType.shifting,
      ),
    );
  }

  toDo(index) {
    String s = myController.text;
    if (index == 0) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => InspectionPage(text: s)));
    } else {
      myController.text = '';
      setState(() {
        _widget = const Text('');
      });
    }
  }

  setCard() {
    return
      Column(
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PersianText(text: 'نام راننده:', fontColor: Colors.red),
              PersianText(text: 'سید حامد جعفری اولیا'),
            ],
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PersianText(text: 'نوع خودرو:', fontColor: Colors.red),
              PersianText(text: 'سبک'),
            ],
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PersianText(text: 'شرکت:', fontColor: Colors.red),
              PersianText(text: 'راهوار'),
            ],
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PersianText(text: 'موبایل راننده:', fontColor: Colors.red),
              PersianText(text: '9023***0913'),
            ],
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PersianText(text: 'کدملی راننده:', fontColor: Colors.red),
              PersianText(text: '2991745689'),
            ],
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PersianText(text: 'مجوز تردد از تاریخ:', fontColor: Colors.red),
            ],
          ),
          PersianText(text: '1401/01/01 الی 1401/02/01'),
        ],
      );

  }

  setTable() {
    return
        Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
          Center(
            child: PersianText(text: 'سوابق آخرین بازرسی ها', fontSize: 20),
          ),
          DataTable(
            border: TableBorder.all(),
            columns: <DataColumn>[
              DataColumn(
                  label: Text('آیتم ها',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('1400/11/12',
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('1401/01/20',
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold))),
            ],
            rows: <DataRow>[
              DataRow(cells: <DataCell>[
                DataCell(Text('نظافت خودرو')),
                DataCell(Text('10')),
                DataCell(Text('12')),
              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text('روکش صندلی')),
                DataCell(Text('15')),
                DataCell(Text('10')),
              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text('لاستیک ها',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold))),
                DataCell(Text('14')),
                DataCell(Text('6',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold))),
              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text('شیشه ها')),
                DataCell(Text('12')),
                DataCell(Text('18')),
              ]),
            ],
          ),
        ]);
  }
}

class TestItem {
  final String label;
  dynamic value;

  TestItem({required this.label, this.value});

  factory TestItem.fromJson(Map<String, dynamic> json) {
    return TestItem(label: json['label'], value: json['value']);
  }
}
