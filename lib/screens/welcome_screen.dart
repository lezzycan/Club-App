import 'package:clubhouse/button/roundButton.dart';
import 'package:clubhouse/utilities/constant.dart';
import 'package:clubhouse/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'second_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: kScaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "✋🏻",
                      style: kTextStyle,
                    ),
                    SizedBox(
                      height: .3.h,
                    ),
                    const Text(
                      'clubhouse',
                      style: kTextStyle2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30.h),
                child: RoundButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  text: '🎄 Welcome! →',
                  style: kWelcomeStyle,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
