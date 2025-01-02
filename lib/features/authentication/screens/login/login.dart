import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              TLoginHeader(dark: dark),
              const TLoginForm(),

              // * Divider
              TFormDivider(dark: dark, dividerText: TTexts.orSignInWith,),
              const SizedBox(height: TSizes.spaceBtwSections),

              // * Footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}


