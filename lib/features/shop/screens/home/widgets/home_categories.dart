import 'package:e_commerce_app/common/widgets/shimmer/category_shimmer.dart';
import 'package:e_commerce_app/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../controllers/category_controller.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isLoading.value) return const TCategoryShimmer();

      if (categoryController.allCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categoryController.allCategories.length,
          itemBuilder: (_, index) {
            final category = categoryController.allCategories[index];
            return TVerticalImageText(
              image: category.imageUrl,
              title: category.name,
              onTap: () => Get.to(() => const SubCategoriesScreen()),
            );
          },
        ),
      );
    });
  }
}
//chla? 2 min hm chl gya
//aap toh bl rhe the credit card lgega ab kaise hua//
//mjak ni kr skte ?kr skte ho..to bs fir ok....yr ab category images same same aa rhi wo firebase se krni pdengi change
//mujhe btado bs m khud krlungi aur pta bhi chl jayega....fir ye chij to rhne  do abhi kyuki duplicity kha ho rhi he vo dhundhni pdegi ,pareshan ho jaoge or ..last me kr lena ye
//product images btao fir tb tk