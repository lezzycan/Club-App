import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/username_screen.dart';

class CardButton extends StatelessWidget {
  const CardButton({ required this.ontap,
    Key? key,
  }) : super(key: key);

  final VoidCallback? ontap;

  @override

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 75.h, vertical: 40.0),
      child:   Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))
        ),
        color: Colors.blue,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 61.w),
          onTap: ontap,
          title: const Text('Next',style: TextStyle(fontSize: 25,
              color: Colors.white),
            textAlign: TextAlign.center,),
          trailing: const Icon(Icons.arrow_forward,
            color: Colors.white,
            size: 30.0,

          ),
          horizontalTitleGap: 9.0,
          minLeadingWidth: 12,
        ),
      ),
    );
  }
}