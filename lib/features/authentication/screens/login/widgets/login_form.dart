import 'package:e_commerce_app/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  final controller = Get.put(LoginController());

  TLoginForm({
    super.key,
    required GlobalKey<FormState> formKey1,
    required GlobalKey<FormState> formKey2,
    required this.dark,
  })  : _formKey1 = formKey1,
        _formKey2 = formKey2;

  final GlobalKey<FormState> _formKey1;
  final GlobalKey<FormState> _formKey2;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              ///Email
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                cursorColor: Colors.grey,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  prefixIcon: Icon(
                    Iconsax.direct_right,
                    color: Colors.grey,
                  ),
                  labelText: TTexts.email,
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              ///Password  this is not  a good practice  where is you controller(Texteditingcontroller) idk
              Obx(() => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                cursorColor: Colors.grey,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  prefixIcon: const Icon(
                    Iconsax.password_check,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                      icon: controller.hidePassword.value? const Icon(Iconsax.eye_slash) : const Icon(Iconsax.eye)),
                  labelText: TTexts.password,
                ),
              ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields / 2,
              ),

              ///Remember me and forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///Remember me
                  Row(
                    children: [
                      Obx(() => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value,
                          activeColor: Colors.blue,
                        ),
                      ),
                      const Text(TTexts.rememberMe),
                    ],
                  ),
                  TextButton(
                      onPressed: () => Get.to(() => const ForgetPassword()),
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                              dark ? Colors.blue : TColors.black)),
                      child: const Text(TTexts.forgetPassword)),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Sign In Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.emailAndPasswordSignIn(),
                      //   {
                      //     // Get.to(() => const NavigationMenu());
                      //
                      //    ApiServices().login('mandeep@gmail.com', 'Mandeep1@23');
                      // }

                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        TTexts.signIn,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ))),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///Create account button
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    style: OutlinedButton.styleFrom(
                        foregroundColor: dark ? TColors.white : TColors.black,
                        // side: BorderSide(
                        //     color: dark ? TColors.white : TColors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      TTexts.createAccount,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  )),
            ],
          ),
        ));
  }
}
