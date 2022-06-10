import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';




import 'package:image_picker/image_picker.dart' as img;
import 'package:image_picker/image_picker.dart';

class CodeProvider extends ChangeNotifier{
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


	 PickedFile? image;

	 Future selectImage(img.ImageSource imageSource) async {
		 try {
			 final pickedImage = await img.ImagePicker().pickImage(source: imageSource);
			 // if (image == null) {
			 //   return;
			 // }
			 // final temporaryImage = File(image.path);
			 // setState(() {
			 // this.image = temporaryImage;
			 image = pickedImage as img.PickedFile? ;
			 //  });
		 } catch (e) {
			 print(e);
			 notifyListeners();
		 }
		 notifyListeners();
	 }

}

