import 'package:e_commerce_app/data/repositories/category_repository/category_repository.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/utils/dummy_data/dummy_data.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel2> allCategories = <CategoryModel2>[].obs;
  RxList<CategoryModel2> featuredCategories = <CategoryModel2>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Load category data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore, API etc.)
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      for(int i=0;i<categories.length;i++){
        print("category image is --->${categories[i].imageUrl}");
      }
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories.where(
          (category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

  /// Load selected category data....
  /// On this method we are uploading dummy data to firebase
uploadDummyData()async{
    try{
      TFullScreenLoader.openLoadingDialog("Uploading...", "assets/images/animations/141594-animation-of-docer.json");
      await _categoryRepository.uploadDummyData(DummyData.categories);
      TFullScreenLoader.stopLoading();
      print("data uploaded successfully");
    }catch(e){
      print("Exception while uploading data is ------------------>$e");
      TFullScreenLoader.stopLoading();
    }
}

  /// Get category or Sub category products
}
//backup kr liya by chance kuch problem ho jaye took...ab git ka kam

//ab kholeo