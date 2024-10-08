import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_buttons.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key, this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [

          ///Cart Items
          const TCartItem(),
          if(showAddRemoveButtons) const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          if(showAddRemoveButtons) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70,
                  ),

                  ///Add Remove Buttons
                  TProductOuantityWithAddRemoveButtons(),
                ],
              ),
              TProductPriceText(price: '256'),
            ],
          ),
        ],
      ),
    );
  }
}
