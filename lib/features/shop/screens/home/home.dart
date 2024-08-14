import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        const SizedBox(
          height: 380.0, // Adjust the height as needed
          child: Stack(
            children: [
              TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    THomeAppBar(),
                    SizedBox(height: TSizes.spaceBtwSections / 2),
                    TSearchContainer(hintText: 'Search in Store'),
                    SizedBox(height: TSizes.spaceBtwSections),
                    Padding(
                      padding: EdgeInsets.only(left: TSizes.defaultSpace),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///Heading
                          TSectionHeading(
                              title: 'Popular Categories',
                              showActionButton: false),
                          SizedBox(height: TSizes.spaceBtwItems),

                          ///Popular Categories
                          THomeCategories(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Promo Slider
              const TPromoSlider(
                banners: [
                  TImages.promoBanner1,
                  TImages.promoBanner2,
                  TImages.promoBanner3,
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Heading
              TSectionHeading(
                  title: 'Popular Products', showActionButton: true, onPressed: () => Get.to(() => const AllProducts()),),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Popular Products
                TGridLayout(itemCount: 6, itemBuilder: (_, index) => const TProductsCardVertical()),
            ],
          ),
        ),
      ],
    )));
  }
}
