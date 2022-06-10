import 'dart:ffi';

import 'package:clubhouse/screens/username_screen.dart';
import 'package:clubhouse/utilities/constant.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../button/card_button.dart';
import '../button/roundButton.dart';

TextEditingController _firstController = TextEditingController();

class NameScreen extends StatelessWidget {
  static const String id = 'name_screen';

  const NameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScaffoldBackgroundColor,
        body: SafeArea(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('What\'s your full name?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w200,
                    )),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _firstController,
                          // autofocus: true,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          textAlign: TextAlign.center,
                          decoration: kTextFieldInputDecoration.copyWith(
                              hintText: 'First',
                              constraints: BoxConstraints(maxWidth: 145.w)),
                          style: kTextFieldStyle,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        TextField(
                          // autofocus: true,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          textAlign: TextAlign.center,
                          decoration: kTextFieldInputDecoration.copyWith(
                              hintText: 'Last',
                              constraints: BoxConstraints(maxWidth: 145.w)),
                          style: kTextFieldStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.3.h,
                    ),
                    const Text(
                      ''
                      'People use their real name on ClubHouse',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Fredoka One',
                          color: Colors.white),
                    ),
                  ],
                ),
                CardButton(
                  ontap: () {
                    final firstName = _firstController.text;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return UserScreen(username: firstName);
                    }));
                  },
                ),
              ],
            ),
          )),
        ));
  }
}
