import 'package:devhub_kenya/common/widgets/login_signup/form_divider.dart';
import 'package:devhub_kenya/common/widgets/login_signup/social_buttons.dart';
import 'package:devhub_kenya/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(DSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(DTexts.signUp,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: DSizes.spaceBtwSections),

            // Form
            const DSignupForm(),
            const SizedBox(height: DSizes.spaceBtwSections),
            /// Divider
            DFormDivider(dividerText: DTexts.orSignupwith.capitalize!),
            const SizedBox(height: DSizes.spaceBtwSections),
            const DSocialButtons(),
          ],
        ),
      )),
    );
  }
}


