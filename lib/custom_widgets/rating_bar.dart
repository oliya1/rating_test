// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rating_test/custom_widgets/persian_text.dart';
import 'package:rating_test/pages/image_picker_example.dart';

class NewRatingBar extends StatefulWidget {
  final IconData? icon;
  final String? name;
  final int? weight;
  int? score;
  final ValueSetter<int>? callback;

  NewRatingBar(
      {Key? key, this.icon, this.name, this.weight, this.score, this.callback})
      : super(key: key);

  @override
  _NewRatingBarState createState() => _NewRatingBarState();
}

class _NewRatingBarState extends State<NewRatingBar> {
  Color picIconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(widget.icon),
              PersianText(text: widget.name),
              RatingBar.builder(
                // initialRating: 0,
                itemSize: 22,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    widget.score = rating.round();
                  });
                  widget.callback!(rating.round() * widget.weight!);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PersianText(text: 'وزن: ' '${widget.weight}', fontSize: 13),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        actionsPadding: EdgeInsets.all(18),
                        content: ImagePickerExample(),
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
                      ),
                    ).then((value) {
                      if(value == 1){
                        setState(() {
                          picIconColor = Colors.green;
                        });
                      }
                    });

                    // final cameras = await availableCameras();

                    // Get a specific camera from the list of available cameras.
                    // final firstCamera = cameras.first;
                    // TakePictureScreen(
                    // //   // Pass the appropriate camera to the TakePictureScreen widget.
                    //   camera: firstCamera,
                    // );
                  },
                  icon: Icon(
                    Icons.photo_camera,
                    size: 20,
                    color: picIconColor,
                  )),
              PersianText(
                text: 'نمره: ' '${widget.score}',
                fontSize: 13,
              )
            ],
          )
        ],
      ),
    );
  }
}
