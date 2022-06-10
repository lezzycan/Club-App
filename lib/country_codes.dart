import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:image_picker/image_picker.dart' as img;

class CodeProvider extends ChangeNotifier {
  List<String> countryCodes = [
    '🇨🇫 +248',
    '🏳️‍⚧ +008',
    '🇧🇾 +012',
    '🇨🇴 +016',
    '🇸🇿 +020',
    '🇩🇿 +024',
    '🇱🇧 +660',
    '🇱🇹 +010',
    '🇲🇱 +028',
    '🇲🇹 +032',
    '🇲🇭 +051',
    '🇲🇶 +533',
    '🇲🇷 +036',
    '🇲🇺 +040',
    '🇾🇹 +031',
    '🇲🇽 +044',
    ' 🇬🇪 +048',
    '🇵🇷 +050',
    '🇰🇷 +052',
    '🇳🇮 +112',
    '🇳🇪 +056',
    '🇲🇽 +084',
    '🇲🇱 +204',
    '🇳🇬 +234',
    '🇺🇸 +1',
    '🇦🇮 +20'
  ];

  File? image;

  Future selectImage(img.ImageSource imageSource) async {
    try {
      final pickedImage =
          await img.ImagePicker().pickImage(source: imageSource);
      if (pickedImage == null) {
        return;
      }
      final temporaryImage = File(pickedImage.path);
      image = temporaryImage;
      notifyListeners();
      //  });
    } catch (e) {
      debugPrint(e.toString());
      notifyListeners();
    }
    notifyListeners();
  }
}
