import 'package:e_commerce_app/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/features/shop/screens/home/home.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark? TColors.black : TColors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: TSizes.md),
          child: Text(
            'Wishlist',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: TSizes.md),
            child: TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //TODO: we need to create  a seperate list for this ,then we pass on this TProductsCardVertical
            // TGridLayout(itemCount: 6, itemBuilder: (_, index) => const TProductsCardVertical()),
          ],
        ),
        ),
      ),
    );
  }
}
