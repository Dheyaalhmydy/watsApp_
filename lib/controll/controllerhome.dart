import 'package:avatars/avatars.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class homecontroller extends GetxController {
  var imagepicker = ImagePicker();
  // ignore: non_constant_identifier_names
  OpenCamera() async {
    var cam = await imagepicker.pickImage(source: ImageSource.camera);
  }
}
