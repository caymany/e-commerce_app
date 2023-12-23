import 'package:devhub_kenya/bindings/general_bindings.dart';
import 'package:devhub_kenya/features/authentication/screens/onboarding/onboarding.dart';
import 'package:devhub_kenya/routes/app_routes.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:devhub_kenya/utils/theme/theme.dart';
import 'package:get/get.dart';

/// --- Use this class to setup themes, initial Bindings, animationa etc


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: DAppTheme.lightTheme,
      darkTheme: DAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      /// Show Loader or Circular Progress Indicator. Meanwhile, Repository is deciding to show relevant screen.
      home: const Scaffold(backgroundColor: DColors.primary, body: Center(child: CircularProgressIndicator(color: DColors.white))),
    );
  }
}