import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({Key? key}) : super(key: key);

  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  //Holds image File
  File? _image;

  //ImagePicker instance.
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: _image != null
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 300,
                    height: 300,
                    child: Image.file(
                      _image!,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('تصویری وجود ندارد'),
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
    final imageFile = await picker.pickImage(source: imageSource);
    File? cropped = await ImageCropper().cropImage(
        sourcePath: imageFile!.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarColor: Colors.deepOrange,
          toolbarTitle: "",
          statusBarColor: Colors.deepOrange.shade900,
          backgroundColor: Colors.white,
        )
     );
//if user doesn't take any image, just return.
    if (imageFile == null) return;
    setState(
      () {
//Rebuild UI with the selected image.
//         print(cropped!.path);
        _image = File(cropped!.path);
      },
    );
  }
}
