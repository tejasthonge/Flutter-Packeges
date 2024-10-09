import 'package:image_picker/image_picker.dart';

class ImageService{
   static pickGalleryImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

}