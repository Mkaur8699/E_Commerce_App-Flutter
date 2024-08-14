import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
    final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();//second  for what ? i think its by mistake

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Logo, title & subtitle
              TLoginHeader(dark: dark),

              ///Form
              TLoginForm(formKey1: formKey1, formKey2: formKey2, dark: dark),

              ///Divider
              TFormDivider(dark: dark),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///Footer
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}




