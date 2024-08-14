import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/network_manager.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// send reset password email
  sendPasswordResetEMail() async {
    try {
      print('inside sendPasswordResetEMail method');
      // Start loading
      TFullScreenLoader.openLoadingDialog('Processing your request...',
          'assets/images/animations/141594-animation-of-docer.json');

      print('after open loding dialog  ');
      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (forgetPasswordFormKey.currentState!.validate()==false){
        //here is you prblm...what?
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show success screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password');

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Processing your request...',
          'assets/images/animations/141594-animation-of-docer.json');

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      //ye bhi galat h false kyu lgana uska kya mtlb smjhana/
      //abhi jo likha hua he uska mtlb ye he ki  ager form filled he to return ho jao yhi se mtlb ki ager validation complete he to return
      //but iska ulta hona chahiye na.....kya ulta hona chahiye?yhi ki ager form me kuch fields empty h or validate nhi h tb return hona chahiye haa
      //to mtlb condition y honi chahiye ki forgetPasswordFormKey.currentState!.validate()  iski value false he to iska mtlb h ki form mr kuch n kuh missing h ya wrong h okkk
      //isliye ye likha h ok ab animation wala krvado
      if (forgetPasswordFormKey.currentState!.validate()==false){
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show success screen
      TLoaders.errorSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password');

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}