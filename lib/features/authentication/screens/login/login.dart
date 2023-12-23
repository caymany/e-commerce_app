import 'package:devhub_kenya/common/widgets/login_signup/social_buttons.dart';
import 'package:devhub_kenya/common/widgets/login_signup/form_divider.dart';
import 'package:devhub_kenya/features/authentication/screens/login/widgets/login_form.dart';
import 'package:devhub_kenya/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:devhub_kenya/common/styles/spacing_styles.dart';
import 'package:devhub_kenya/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: DSpacingStyle.paddingWithAppBarHeight,
              child: Column(
                children: [
                  ///Logo Title & Subtitle
                  DLoginHeader(),

                  // Form
                  DLoginForm(),

                  DFormDivider(dividerText: DTexts.orSignInith),

                  DSocialButtons(),
                ],
              ),
      ),
    ));
  }
}
