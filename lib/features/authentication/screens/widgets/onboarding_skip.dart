import 'package:e_commerce_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/device/device_utility.dart';
import '../login/login.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
        top: TDeviceUtils.getAppBarHeight(),
        child: TextButton(onPressed: () {
          Get.offAll(const LoginScreen());
          OnboardingController.instance.skipPage();
        }, child: const Text('Skip')));
  }
}
