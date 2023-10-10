import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagepicker = ImagePicker();
  String imageUrl;

  XFile? _file = await _imagepicker.pickImage(source: source);
  if (_file != null) {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('Profileimages');
    Reference referenceImageTobeUploaded =
        referenceDirImages.child('${_file?.name}');

    try {
      await referenceImageTobeUploaded.putFile(File(_file!.path));
      imageUrl = await referenceImageTobeUploaded.getDownloadURL();
    } catch (error) {}
  } else {
    print('No image selected');
  }
}
