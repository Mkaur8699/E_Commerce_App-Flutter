import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/helpers/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
       TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        'assets/images/animations/141594-animation-of-docer.json',
      );
print('after loader starts----------------------------->');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        await TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'No Internet',
            message: 'Please check your internet connection.');
        return;
      }

      //understand
      if (loginFormKey.currentState!.validate()==false) {
        await TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Invalid Input',
            message: 'Please enter a valid email and password.');
        return;
      }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      await TFullScreenLoader.stopLoading();
      print('after stop loading inside login controller --------------->>>>');
      AuthenticationRepository.instance.screenRedirect();
      // Navigate to the menu screen after a slight delay to ensure a smooth transition
      // Future.delayed(const Duration(seconds: 1), () {
      //   Get.offAll(()=> const NavigationMenu());
      //   // Get.toNamed('/menu');name? kiska jisoe jana he login ke baad
      //   //menu is define ?....isme na kuch error aa rha tha fir maine ye chat gpt se likha
      // });
      //ye bi mistake hi h   // Get.toNamed('/menu'); ok
      //please insert your changed password....fir bhi nhi chl rha
    } catch (e) {
      await TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('Logging you in...',
          'assets/images/animations/141594-animation-of-docer.json');

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance
          .signInWithGoogle();

      // Save user record using an instance of UserController
      final userController = UserController.instance;
      await userController.saveUserRecord(userCredentials);

      await TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch(e){

      // Remove loader
      await TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}