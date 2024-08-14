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

//ab kholeo..kuch ni h vo ..... git push --set-upstream origin mk_dev ....MTLB YHI KI MK_DEV REMOTE PR NHI HE ....USKO REMOTE PR BNAO BY USING THIS COMMAND OK.A
//ab  git push --set-upstream origin mk_dev  ye nhi likhna pda kyuki remote pr phle se mk_dev pdi hui he isl
//ab mujhe firse name change krna ye wala....ab jo bhi kam kroge is project me ...to kam krne ke baad ...
//first cmnd--->  git add .
//second cmnd --> git commit -m "message"
//third comand---> git push

//bs ok...add hogya us me ab project?.hua add haa.. ye sara add kro app
// yr ye comments bhi add hogye/.....wo ab isi code mein se remove krke......ye sari commands chladu ek bar???..apko itni jldi kyu he..jldi toh nhi...me add krna sikha rha huna ..to remove kis khushi me kroge....ok
//abhi sirf apki branch me add hue he ye sb ....master me bhi krne he ..kyuki master ek common branch he jisme sbse latest code rhta he ok
//hua ? ha..smjme bhi aya ki ni nhiii..pucho jo ni ayA
//pehle jo changes maine kre the wo mk_dev mein kre the..ha
//uske bad jo aapne kre changes wo master mein kre?....dekho..abhi current konsi he mk wali
///to ap abhi mk wali me kam kr rhe ho...to jb app ye sb kroge
///first cmnd--->  git add .
///second cmnd --> git commit -m "message"
///third comand---> git push
///
/// to jo bhi kam apne kiya hoga vo sara remote pr pdi hui mk_dev me chla jayega okkk...puch lo kuch bhi isme se doubt he to nhi ab thik hai
/// fir mk_dev me to chle gye ....lekin ab master me merge bhi krned hote he okk..to uske liye pull request create krni pdti he current branch se......kro fir
/// ki thi na abhi git pr jqke,,,wo dubara bta do ek bar..uske liye changes krne pdene ....dekho