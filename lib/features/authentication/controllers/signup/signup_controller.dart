import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  //signup
  void signUp() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Wait..', 'assets/images/animations/141594-animation-of-docer.json');
      print('opening loading dialog');

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.warningSnackBar(
            title: 'No Internet',
            message: 'Please check your internet connection and try again.');
        return;
      }

      // Form validation
      if (signUpFormKey.currentState!.validate()==false){
        return;
      }

      // Privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
            'In order to create an account, you must read and accept the Privacy Policy & Terms of Use.');
        return;
      }
      //Registers the user with email and password using AuthenticationRepository.
      // Register user in Firebase Authentication & Save user data in Firebase
      UserCredential? userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      //If registration fails, displays an error message.
      if (userCredential?.user == null) {
        TLoaders.errorSnackBar(title: 'Registration Failed', message: 'Unable to register. Please try again.');
        return;
      }

      // On successful registration, creates a new UserModel with the user details.
      // Save authenticated user data in Firebase Firestore
      final newUser = UserModel(
        id: userCredential!.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      // Saves the user record in Firebase Firestore using UserRepository.
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Displays a success message and navigates to the email verification screen.
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to confirm.');

      TFullScreenLoader.stopLoading();
      // Move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim(),));

      //In case of any error, displays an error message.
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}


// ye kl chl nhi rha tha ye bhi chl gya ab
//btana kya gadbad kri thi
//shant....chl gya?.....hnji....mistake kya thi?