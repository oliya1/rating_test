import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({Key? key}) : super(key: key);

  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  //Holds image File
  File _image = File('');

  //ImagePicker instance.
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _image != null ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 300,
                height: 300,
                child: Image.file(
                  _image,
                ),
              ),
            )
                : Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text('No image selected'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () => _getImage(ImageSource.gallery),
                icon: Icon(Icons.image),
                label: Text('فایل'),
              ),
              ElevatedButton.icon(
                onPressed: () => _getImage(ImageSource.camera),
                icon: Icon(Icons.camera),
                label: Text('دوربین'),
              ),
            ],
          ),
        ],
      );
  }

  //ImageSource: Camera and Gallery.
  _getImage(ImageSource imageSource) async {
    PickedFile? imageFile = await picker.getImage(source: imageSource);
//if user doesn't take any image, just return.
    if (imageFile == null) return;

    setState(
          () {
//Rebuild UI with the selected image.
        _image = File(imageFile.path);
      },
    );
  }
}
