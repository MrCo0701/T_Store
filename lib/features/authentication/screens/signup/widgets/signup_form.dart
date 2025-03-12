
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Obx(() {
      if (controller.goToVerifyScreen.value) {
        Get.to(() => const VerifyEmailScreen());
        controller.goToVerifyScreen.value = false;
      }

      return Form(
          key: controller.signupFormKey,
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                      controller: controller.lastName,
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.lastName,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                  )
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              // * User Name
              TextFormField(
                controller: controller.userName,
                decoration: const InputDecoration(
                    labelText: TTexts.username,
                    prefixIcon: Icon(Iconsax.user_edit)),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              //* Email
              TextFormField(
                validator: (value) => TValidator.validateEmail(value),
                controller: controller.email,
                decoration: const InputDecoration(
                    labelText: TTexts.email,
                    prefixIcon: Icon(Iconsax.direct)),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              //* Phone Number
              TextFormField(
                validator: (value) => TValidator.validatePhoneNumber(value),
                controller: controller.phoneNumber,
                decoration: const InputDecoration(
                    labelText: TTexts.phoneNo,
                    prefixIcon: Icon(Iconsax.call)),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              //* Password
              Obx(
                    () => TextFormField(
                  validator: (value) => TValidator.validatePassword(value),
                  controller: controller.password,
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              const TTermsAndConditionCheckBox(),
              const SizedBox(height: TSizes.spaceBtwSections),

              //* Signup Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.signup(),
                    child: const Text(TTexts.createAccount)),
              )
            ]));
      }
    );
  }
}
