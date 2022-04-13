import 'package:flutter/cupertino.dart';

class PersianText extends StatelessWidget {
  final String? text;
  final Color? fontColor;
  final double? fontSize;
  const PersianText({Key? key, this.text, this.fontColor, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${text}', style: TextStyle(
      fontSize: fontSize,
      color: fontColor,
      fontFamily: 'IRANSans'
    ),);
  }
}
