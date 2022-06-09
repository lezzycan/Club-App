import 'package:clubhouse/screens/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../button/roundButton.dart';
import '../utilities/constant.dart';
import '../country_codes.dart';
import 'dart:io' show Platform;
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  late final TextEditingController _phoneNumber;
  bool spinning = false;

  @override
  void initState() {
    super.initState();
    _phoneNumber = TextEditingController();

  }

  @override
  void dispose() {
    super.dispose();
    _phoneNumber.dispose();
  }

  String? selectedCountryCode = '🇳🇬 +234' ;

  DropdownButton<String> androidDropdown() {

    List<DropdownMenuItem<String>> dropDownItems = [];
    for(var countryCode in Provider.of<CodeProvider>(context).countryCodes){
      DropdownMenuItem<String> newItem = DropdownMenuItem(
        value: countryCode ,
        child: Text(countryCode, style: kDropdownTextStyle,),
      );
      dropDownItems.add(newItem);
      //}
    }

    return DropdownButton<String>(
      elevation: 0,
        dropdownColor: Colors.black,
         value: selectedCountryCode,
        items: dropDownItems,
        onChanged: (value) {
          setState(() {
              value  = selectedCountryCode;
          });
        });
  }

  CupertinoPicker iosPicker() {
    List<Text> pickerItems = [];
     final codes = Provider.of<CodeProvider>(context).countryCodes;
     for (var countryCode in codes) {
       var newItems = Text(countryCode);
        pickerItems.add(newItems);
      }
    return CupertinoPicker(
        itemExtent: 20.0,
        onSelectedItemChanged: (int value) {},
        children: pickerItems);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0, bottom: 50.0),
        child: ModalProgressHUD(
          inAsyncCall: spinning,
          color: Colors.grey,
          opacity: 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sign in with your phone #',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white12,
                    fontWeight: FontWeight.w400),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 58.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10.0, right: 30.0),
                          color: Colors.white10,
                          child: Platform.isAndroid
                              ? androidDropdown()
                              : iosPicker(),
                        ),

                        Expanded(
                          child: TextField(
                            controller: _phoneNumber,
                            // maxLength: 10,
                            autocorrect: false,
                            enableSuggestions: false,
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            style: kTextFieldStyle,
                            decoration: kTextFieldInputDecoration,
                          ),
                        )
                      ],
                    ),
                  ),
                   SizedBox(
                    height: 1.h,
                  ),
                  const Text(
                    "By entering your number, "
                    "you're agreeing to our Terms and Service Policy. Thanks",
                    style: kText2Style,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Container(
                width: double.infinity,
               padding:  EdgeInsets.symmetric(horizontal: 100.w),
                margin: const EdgeInsets.only(bottom: 20.0),
                child: RoundButton(
                  onPressed: () async{
                    final phoneNumber = _phoneNumber.text;
                     setState(() {
                       spinning = true;
                     });
                     await Future.delayed(const Duration(seconds: 2));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OTPScreen(
                                selectedCountryCode: selectedCountryCode ,
                                phoneNumber: phoneNumber),),);
                    _phoneNumber.clear();
                    setState(() {
                      spinning = false;
                    });
                  },
                  text: 'Next →',
                  style: kButtonStyle,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
