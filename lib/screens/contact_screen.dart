import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

bool isLoading = false;
class Contact extends StatelessWidget {

  static const id = 'contact';
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top:38.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 22),
                  alignment: Alignment.topRight,
                  child: const Text('Skip',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white),
                  )),
                 const SizedBox(
                   height: 30.0,
                 ),
                const Text('To find friends on clubHouse tap allow'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
