



import 'package:clubhouse/button/card_button.dart';
import 'package:clubhouse/country_codes.dart';
import 'package:clubhouse/image_selection.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import 'contact_screen.dart';



class PictureScreen extends StatefulWidget {
  static const id = 'picture_screen';

  const PictureScreen({Key? key}) : super(key: key);

  @override
  State<PictureScreen> createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 38.0),
          child: Stack(children: [
            Container(
                margin: const EdgeInsets.only(right: 22),
                alignment: Alignment.topRight,
                child: const Text(
                  'Skip',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 58.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Add a profile photo!',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white12,
                      child: InkWell(

                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => const ImagePicker(

                              ),);
                        },
                        child: Provider.of<CodeProvider>(context, listen: false).image == null ?

                        const Icon(
                          Icons.add_to_photos,
                          size: 60,
                          color: Colors.blue,
                        ) : Image.file(File(Provider.of<CodeProvider>(context, listen: false).image!.path)),

                      ),
                    ),
                  ),
                   CardButton(ontap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                       return const Contact();
                     } ));
                   }
                   ),
                ],
              ),
            ),
            const Positioned(
              bottom: 80,
              right: 170,
              left: 170,
              child: Text(
                'This is visible to everyone',
                style: TextStyle(fontSize: 17.0, color: Colors.white),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

