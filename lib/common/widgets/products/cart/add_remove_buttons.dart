import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';

class TProductOuantityWithAddRemoveButtons extends StatelessWidget {
  const TProductOuantityWithAddRemoveButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          width: 32,
          height: 32,
          size: TSizes.md,
          icon: Iconsax.minus,
          color: dark? TColors.white : TColors.black,
          backgroundColor: dark? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Text('2', style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: TSizes.spaceBtwItems,),
        const TCircularIcon(
          width: 32,
          height: 32,
          size: TSizes.md,
          icon: Iconsax.add,
          color: TColors.white,
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}
