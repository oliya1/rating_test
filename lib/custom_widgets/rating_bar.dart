// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rating_test/custom_widgets/persian_text.dart';
import 'package:rating_test/pages/image_picker_example.dart';

class NewRatingBar extends StatelessWidget {
  final IconData? icon;
  final String? name;
  final int? weight;

  const NewRatingBar({Key? key, this.icon, this.name, this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child:
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon),
              PersianText(text: name),
              RatingBar.builder(
                // initialRating: 0,
                itemSize: 22,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) =>
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              PersianText(text: 'وزن: ' '${weight}', fontSize: 13),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const AlertDialog(
                            content:
                              // Text('salam')
                              ImagePickerExample()
                          ),
                    );
                    // final cameras = await availableCameras();

                    // Get a specific camera from the list of available cameras.
                    // final firstCamera = cameras.first;
                    // TakePictureScreen(
                    // //   // Pass the appropriate camera to the TakePictureScreen widget.
                    //   camera: firstCamera,
                    // );
                  }
                  , icon: const Icon(Icons.photo_camera, size: 20)
              )
            ],


          )

        ],
      ),
    );
  }
}
