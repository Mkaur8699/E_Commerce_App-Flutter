import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$1460.0', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems/2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$5.00', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems/2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$145.40', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.titleMedium,),
            Text('\$1800.4', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
      ],
    );
  }
}
