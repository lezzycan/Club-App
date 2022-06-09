import 'dart:io';

import 'package:clubhouse/screens/picture_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' as img;
import 'package:provider/provider.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({  Key? key}) : super(key: key);

  
  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  
  //
  img.PickedFile? image;

  Future selectImage(img.ImageSource imageSource) async {
    try {
      final pickedImage = await img.ImagePicker().pickImage(source: imageSource);
      // if (image == null) {
      //   return;
      // }
      // final temporaryImage = File(image.path);
      setState(() {
        // this.image = temporaryImage; 
        image = pickedImage as img.PickedFile?;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.transparent,
          height: 100.0,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              const Text(
                'Choose profile photo',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 100,
                      tooltip: 'Camera',
                      color: Colors.black,
                      //alignment: Alignment.center,

                      onPressed: () {
                        selectImage(img.ImageSource.camera);
                      },
                      icon: const Icon(
                        Icons.camera, semanticLabel: 'Camera',
                        // size: 180,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      iconSize: 100,
                      tooltip: 'Gallery',
                      color: Colors.black,
                      onPressed: () {
                        selectImage(img.ImageSource.gallery);
                      },
                      icon: const Icon(
                        Icons.image,
                        //    size: 180,

                        semanticLabel: 'Gallery',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
