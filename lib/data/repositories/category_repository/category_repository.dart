import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/services/firebase_storage_service.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/dummy_data/dummy_data.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel2>> getAllCategories(String collectionName) async {
    try {
      final snapshot = await db.collection(collectionName).get();

      final list = snapshot.docs
          .map((document) => CategoryModel2.fromDocumentSnapshot(document))
          .toList();

      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Get Sub categories

  ///Upload categories to the Cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel2> categories,String collectionName) async {
    try {
      // Upload all the categories along with their images
      final storage = Get.put(TFirebaseStorageService());

      // Loop through each category
      for (var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.imageUrl);

        // Upload image and Get its URL
        final url =
            await storage.uploadImageData(collectionName, file, category.name);

        // Assign Url to Category.image attribute
        category.imageUrl = url;

        // Store Category in Firestore
        await db
            .collection(collectionName)//yha
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}

