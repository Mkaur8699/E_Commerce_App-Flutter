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
  RxList<CategoryModel2> products = <CategoryModel2>[].obs;

  RxList<CategoryModel2> featuredCategories = <CategoryModel2>[].obs;

  @override
  void onInit() {
    fetchCategories();
    print("fetching products------------------------------");
    fetchProducts();
    super.onInit();
  }

  /// Load category data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore, API etc.)
      final categories = await _categoryRepository.getAllCategories(
          "Categories");

      // Update the categories list
      for (int i = 0; i < categories.length; i++) {
        print("category image is --->${categories[i].imageUrl}");
      }
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories.where(
              (category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }

  /// Load selected category data....
  /// On this method we are uploading dummy data to firebase
  uploadDummyData() async {
    try {
      TFullScreenLoader.openLoadingDialog("Uploading...",
          "assets/images/animations/141594-animation-of-docer.json");
      await _categoryRepository.uploadDummyData(DummyData.categories,
          "Categories"); //yhi name thA NA ?? konsa name...
      TFullScreenLoader.stopLoading();
      print("data uploaded successfully");
    } catch (e) {
      print("Exception while uploading data is ------------------>$e");
      TFullScreenLoader.stopLoading();
    }
  }

  /// Get category or Sub category products
  /// apne ni kiya kuch bhi ?.....nhi m login signup kr rhi thi....aaj hi krne lgi thi isko abhi....toh usme error aaya..kha he eror wahi firebase wala...ok

  uploadDummyProductImages() async {
    try {
      TFullScreenLoader.openLoadingDialog("Uploading...",
          "assets/images/animations/141594-animation-of-docer.json");
      await _categoryRepository.uploadDummyData(DummyData.products, "Products");
      TFullScreenLoader.stopLoading();
      print("data uploaded successfully");
    } catch (e) {
      print("Exception while uploading data is ------------------>$e");
      TFullScreenLoader.stopLoading();
    }
  }


  //fetch all products
  Future<void> fetchProducts() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore, API etc.)
      final allProducts = await _categoryRepository.getAllCategories(
          "Products");

      // Update the products list
      for (int i = 0; i < products.length; i++) {
        print("product image is --->${products[i].imageUrl}");
      }
      products.assignAll(allProducts);
      print("product is =========>>>>>>>${products.toString()}");
      // Filter featured products
      // featuredCategories.assignAll(allCategories.where(
      //         (category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }


}