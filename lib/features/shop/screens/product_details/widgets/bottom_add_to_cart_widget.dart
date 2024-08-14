import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(
                height: 40,
                width: 40,
                color: Colors.white,
                backgroundColor: TColors.darkGrey,
                icon: Iconsax.minus,
              ),
              const SizedBox(width: TSizes.spaceBtwItems,),
              Text('2', style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall,),
              const SizedBox(width: TSizes.spaceBtwItems,),
              const TCircularIcon(
                height: 40,
                width: 40,
                color: Colors.white,
                backgroundColor: TColors.black,
                icon: Iconsax.add,
              ),
            ],
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black),
            ),
            onPressed: () => Get.to(() => const CartScreen()),
            icon: const Icon(Iconsax.bag_tick, color: Colors.white,),
            label: Text(
              'Add to Cart', style: TextStyle(color: dark? TColors.white : TColors.white),),),
        ],
      ),
    );
  }
}
