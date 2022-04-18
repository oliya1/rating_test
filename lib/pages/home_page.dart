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
    await Future.delayed(Duration(milliseconds: 1000));
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
            text: 'امور ایمنی شرکت ملی صنایع مس ایران',
            fontSize: 21,
          )),
      body: Column(
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
                // initialList: dummyList,
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
                            // title: const Text('AlertDialog Title'),
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
                            FocusScope.of(context).dispose()
                          }
                      });

                  // setState(() {
                  //   _widget = setCard();
                  // });
                },
              )),
          Container(
            child: _widget,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'ثبت بازرسی فنی',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dangerous),
            label: 'ثبت تخلف',
          ),
        ],
        selectedItemColor: Colors.deepOrange,
        // unselectedItemColor: Colors.red,
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
    }
  }

  setCard() {
    return Card(
      child: Column(
        children: const [
          PersianText(text: 'نام راننده: سید حامد جعفری اولیا'),
          PersianText(text: 'نوع خودرو: سبک'),
          PersianText(text: 'شرکت: راهوار'),
          PersianText(text: 'موبایل راننده: 0913***9023'),
          PersianText(text: 'کدملی راننده: 2991743247'),
          PersianText(text: 'مجوز تردد: از تاریخ 1401/01/01 الی 1401/02/01'),
        ],
      ),
    );
  }

  setTable() {
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
          const Center(
            child: PersianText(text: 'سوابق آخرین بازرسی ها', fontSize: 23),
          ),
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                  label: Text('آیتم ها',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('1400/11/12',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('1401/01/20',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ],
            rows: const <DataRow>[
              DataRow(cells: <DataCell>[
                DataCell(Text('نظافت خودرو')),
                DataCell(Text('10')),
                DataCell(Text('12')),
              ]),
              DataRow(cells: <DataCell>[
                DataCell(Text('روکش صندلی ها')),
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
        ]));
  }

  setTable1() {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(64),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(
              height: 32,
              color: Colors.green,
              child: PersianText(text: ''),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Container(
                height: 32,
                width: 32,
                color: Colors.red,
              ),
            ),
            Container(
              height: 64,
              color: Colors.blue,
            ),
          ],
        ),
        TableRow(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          children: <Widget>[
            Container(
              height: 64,
              width: 128,
              color: Colors.purple,
            ),
            Container(
              height: 32,
              color: Colors.yellow,
            ),
            Center(
              child: Container(
                height: 32,
                width: 32,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ],
    );
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
