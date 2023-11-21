import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker imagepicker = ImagePicker();
  final currentUser = FirebaseAuth.instance.currentUser!;

  String imageUrl;

  XFile? file = await imagepicker.pickImage(source: source);
  if (file != null) {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('Profileimages');
    Reference referenceImageTobeUploaded =
        referenceDirImages.child(file.name);

    try {
      await referenceImageTobeUploaded.putFile(File(file.path));
      imageUrl = await referenceImageTobeUploaded.getDownloadURL();
      FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .update({'Profile image': imageUrl});
    } catch (error) {}
  } else {
    print('No image selected');
  }
}

Future<void> updatePhoto(ImageSource source) async {
  final ImagePicker imagepicker = ImagePicker();
  final currentUser = FirebaseAuth.instance.currentUser!;

  String imageUrl;

  XFile? file = await imagepicker.pickImage(source: source);

  DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(currentUser.uid)
      .get();

  Reference referenceImageTobeUploaded =
      FirebaseStorage.instance.refFromURL(documentSnapshot['Profile image']);
  if (file != null) {
    try {
      await referenceImageTobeUploaded.putFile(File(file.path));
      imageUrl = await referenceImageTobeUploaded.getDownloadURL();
      FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .update({'Profile image': imageUrl});
    } catch (error) {
      print(error.toString());
    }
  } else {
    print('No image selected');
  }
}
