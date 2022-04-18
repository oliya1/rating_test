// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:givestarreviews/givestarreviews.dart';
// import 'package:rating_test/custom_widgets/persian_text.dart';
//
// class ItemBox extends StatefulWidget {
//   final IconData? icon;
//   final String? name;
//   const ItemBox({Key? key, this.icon, this.name}) : super(key: key);
//
//   @override
//   _ItemBoxState createState() => _ItemBoxState(icon: icon, name: name, initStar: 0);
// }
//
// class _ItemBoxState extends State<ItemBox>{
//   final IconData? icon;
//   final String? name;
//   int? initStar;
//   _ItemBoxState({this.icon, this.name, this.initStar});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: const EdgeInsets.all(4),
//       child: Card(
//         margin: const EdgeInsets.all(10),
//         elevation: 5,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Icon(icon),
//             PersianText(text: name),
//             StarRating(
//                 onChanged: (rate) {
//               _showToast(context, rate.toString());
//             }),
//           ],
//         ),
//       ),
//
//     );
//   }
//   void _showToast(BuildContext context, String txt) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         duration: const Duration(milliseconds: 500),
//         content: Text(txt),
//       ),
//     );
//   }
// }
//
