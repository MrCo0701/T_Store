import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  final goToSuccessScreen = false.obs;

  @override
  void onInit() {
    sendEmailVerification();
    super.onInit();
    // TODO: implement onIni
    // ever(goToSuccessScreen, (value) {
    //   if (value) {
    //     TLoaders.warningSnackBar(title: 'oke');
    //     Get.to(() => LoginScreen());
    //   }
    // });
  }

  // * Send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please check your inbox and verify your email');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: TImages.successfulRegisterAnimation,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  // * Manually Check if Email Verified
  Future <void> checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    await currentUser!.reload();
    if (currentUser.emailVerified) {
      goToSuccessScreen.value = true;
    }else {
      TLoaders.errorSnackBar(title: 'ngu');
    }
  }
}
