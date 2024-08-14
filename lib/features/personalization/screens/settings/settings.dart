import 'package:e_commerce_app/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/personalization/screens/address/address.dart';
import 'package:e_commerce_app/features/shop/controllers/category_controller.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart_screen.dart';
import 'package:e_commerce_app/features/shop/screens/order/order.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../authentication/screens/login/login.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController=Get.put(CategoryController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TPrimaryHeaderContainer(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: TSizes.defaultSpace),
                        child: Text(
                          'Account',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections / 2),
                      TUserProfileTile(
                        onTap: () => Get.to(() => const ProfileScreen()),
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections / 2),
                    ],
                  ),
                ),
              ),
            ),
            // Add more widgets below TPrimaryHeaderContainer
            const SizedBox(height: TSizes.spaceBtwSections / 2),
            const Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace),
              child: TSectionHeading(
                title: 'Account Settings',
                showActionButton: false,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.defaultSpace),
              child: Column(
                children: [
                  TSettingsMenuTile(
                      title: 'My Addresses',
                      subTitle: 'Set shopping delivery address',
                      onTap: () => Get.to(() => const UserAddressScreen()),
                      icon: Iconsax.safe_home),
                  TSettingsMenuTile(
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout',
                      onTap: () => Get.to(() => const CartScreen()),
                      icon: Iconsax.shopping_cart),
                  TSettingsMenuTile(
                      title: 'My Orders',
                      subTitle: 'In-progress and Completed Orders',
                      onTap: () => Get.to(() => const OrderScreen()),
                      icon: Iconsax.bag_tick),
                  const TSettingsMenuTile(
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to registered bank account',
                      icon: Iconsax.bank),
                  const TSettingsMenuTile(
                      title: 'My Coupons',
                      subTitle: 'List of all the discounted coupons',
                      icon: Iconsax.discount_shape,),
                  const TSettingsMenuTile(
                      title: 'Notifications',
                      subTitle: 'Set any kind of notification message',
                      icon: Iconsax.notification,),
                  const TSettingsMenuTile(
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts',
                      icon: Iconsax.security_card,),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingsMenuTile(
                      title: 'Load Data',
                      subTitle: 'Upload Data to your Cloud Firebase',
                      icon: Iconsax.document_upload, onTap: () {
                        print("upload data btn pressed");
                        categoryController.uploadDummyData();
                  },),
                  TSettingsMenuTile(
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on loaction',
                    icon: Iconsax.location,
                    trailing: Switch(value: true, onChanged: (value) {}), onTap: () {  },
                  ),
                  TSettingsMenuTile(
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    icon: Iconsax.security_user,
                    trailing: Switch(value: false, onChanged: (value) {}), onTap: () {  },
                  ),
                  TSettingsMenuTile(
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    icon: Iconsax.image,
                    trailing: Switch(value: false, onChanged: (value) {}), onTap: () {  },
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.offAll(() => const LoginScreen()),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: TColors.primary,
                            foregroundColor: Colors.white),
                        child: const Text('Logout', style: TextStyle(fontSize: 16),),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
