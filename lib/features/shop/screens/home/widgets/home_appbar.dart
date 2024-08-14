import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../common/widgets/shimmer/shimmer.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
    this.title = TTexts.homeAppbarSubTitle,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: TSizes.md, right: TSizes.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TTexts.homeAppbarTitle,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(color: Colors.white),
                      ),
                      Obx(() {
                        if (controller.profileLoading.value) {
                          return const TShimmerEffect(width: 80, height: 15);
                        } else {
                          return Text(
                            controller.user.value.fullName,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .apply(color: Colors.white),
                          );
                        }
                      }),
                    ],
                  ),
                  TCartCounterIcon(
                    onPressed: () => Get.to(() => const CartScreen()),
                    iconColor: TColors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
