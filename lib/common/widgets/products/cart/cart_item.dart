import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [

        ///Image
        TRoundedImage(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark? TColors.darkerGrey : TColors.light,
            imageUrl: TImages.productImage1),
        const SizedBox(width: TSizes.spaceBtwItems,),

        ///Title, price & size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleTextWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: TProductTitleText(title: 'Black Sport Shoes', maxLines: 1,)),

              ///Attributes
              Text.rich(TextSpan(
                children: [
                  TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: 'UK 08 ', style: Theme.of(context).textTheme.bodyLarge),
                ],
              )),
            ],
          ),
        ),
      ],
    );
  }
}
