import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(height: 75,
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
          left: TSizes.md,
          right: TSizes.sm,
          top: TSizes.sm,
          bottom: TSizes.sm),
      child: Row(
        children: [

          ///Textfield
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a Promo Code? Enter here',
                hintStyle: TextStyle(
                    color: dark ? TColors.white : TColors.black),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          ///Button
          SizedBox(
              height: 60,
              width: 93,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.grey.withOpacity(0.2),
                  foregroundColor: dark? TColors.white.withOpacity(0.5) : TColors.dark.withOpacity(0.5),
                  side: BorderSide(color: Colors.grey.withOpacity(0.1)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {},
                child: const Text('Apply', style: TextStyle(fontSize: 14),),
              )),
        ],
      ),
    );
  }
}
