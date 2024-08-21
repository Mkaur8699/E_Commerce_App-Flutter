import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/dummy_data/dummy_data.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel2 category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [

            ///Brands
            const TBrandShowCase(images: [
              TImages.productImage3,
              TImages.productImage2,
              TImages.productImage1
            ]),
            const TBrandShowCase(images: [
              TImages.productImage3,
              TImages.productImage2,
              TImages.productImage1
            ]),
            const SizedBox(height: TSizes.spaceBtwItems,),

            ///Brands
            TSectionHeading(title: 'You might like', onPressed: (){}),
            const SizedBox(height: TSizes.spaceBtwItems,),
            //isko comment kr rha hu ek bar
            // TGridLayout(itemCount: 6, itemBuilder: (_ ,index) => const TProductsCardVertical()),
          ],
        ),
      ),],
    );
  }
}