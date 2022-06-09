import 'package:clubhouse/button/roundButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:pinput/pinput.dart';
import '../utilities/constant.dart';
import 'name_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: const Color.fromRGBO(234, 239, 243, 1),
  ),
);

final _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class OTPScreen extends StatefulWidget {
  const OTPScreen(
      {required this.phoneNumber, this.selectedCountryCode, Key? key})
      : super(key: key);
  final String? phoneNumber;
  final String? selectedCountryCode;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  String? _verificationCode;

  User? user;
  String verificationID = "";

  bool otpVisibility = false;
  bool spinning = false;

  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _verifyPhone();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: const Text(
          'OTP Verification',
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinning,
        opacity: 0.2,
        color: Colors.grey,


        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  'Verify +234${widget.phoneNumber}',
                  //  'Verify ${widget.selectedCountryCode}${widget.phoneNumber}',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Pinput(
              length: 6,
              controller: otpController,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
            ),
            const SizedBox(
              height: 10,
            ),
            RoundButton(
              onPressed: () async{
                try {
                  if (otpVisibility) {
                    setState(() {
                      spinning = true;
                    });
                    await Future.delayed(const Duration(seconds: 3));
                    verifyOTP();
                    setState(() {
                      spinning = false;
                    });
                  } else {
                    setState(() {
                      spinning = true;
                    });
                    setState(() {
                      spinning  = true;
                    });
                    await Future.delayed(const Duration(seconds: 3));
                    loginWithPhone();
                    setState(() {
                      spinning = false;
                    });
                  }
                } catch (e) {
                  print(e);
                }
              },
              text: otpVisibility ? "Verify" : "Login",
              style: kButtonStyle,
              borderRadius: BorderRadius.circular(15.0),
            ),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  // _verifyPhone() async {
  //   await _auth.verifyPhoneNumber(
  //       phoneNumber: '+234${widget.phoneNumber}',
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await _auth.signInWithCredential(credential).then((value) {
  //           if (value.user != null) {
  //             Navigator.pushNamed(context, NameScreen.id);
  //           }
  //         });
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         print(e.message);
  //       },
  //       codeSent: (String verificationID, int? resendToken) {
  //         setState(() {
  //           _verificationCode = verificationID;
  //         });
  //       },
  //       codeAutoRetrievalTimeout: (String verificationID) {
  //         setState(() {
  //           _verificationCode = verificationID;
  //         });
  //       },
  //       timeout: Duration(seconds: 60));
  // }



  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await _auth.signInWithCredential(credential).then(
      (value) {
        setState(() {
          user = _auth.currentUser;
        });
      },
    ).whenComplete(() {
      if (user != null) {
        Fluttertoast.showToast(
          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const NameScreen(),
          ),
        );
      } else {
        Fluttertoast.showToast(
          msg: "your login is failed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    });
  }

  void loginWithPhone() async {
    _auth.verifyPhoneNumber(
      phoneNumber: '+234${widget.phoneNumber}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
