import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

///this is our service class where we deal with firebase storage
class TFirebaseStorageService {
  ///this is our FirebaseStorage object/instance
  final _firebaseStorage = FirebaseStorage.instance;

  //this is method to get image data from our assets folder
  //this is also fine yes
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);

      /// here is  byte data ,not Uint8List data
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

      ///this is our Uint8List data
      return imageData;
    } catch (e) {
      throw "Error loading image data $e";
    }
  }

//upload image data on firebase storage
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'PlatForm Exception: ${e.message}';
      } else {
        throw 'Something Went Wrong! Please try again.';
      }
    }
  }

  /// Upload image on Cloud Firebase storage
  /// Returns the download URL of the uploaded image
  Future<String> uploadImageFile(String path, XFile image) async{
    try{
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch(e) {

      // Handle exceptions gracefully
      if(e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if(e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if(e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      } else{
        throw 'Something went wrong!. Please try again';
      }
    }
  }
}
