import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/device/device_utility.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class DTabBar extends StatelessWidget implements PreferredSizeWidget {
  const DTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? DColors.black : DColors.white,
      child: TabBar(
          tabs: tabs,
          isScrollable: true,
          indicatorColor: DColors.primary,
        labelColor: dark ? DColors.white : DColors.primary,
        unselectedLabelColor: DColors.darkerGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DDeviceUtils.getAppBarHeight());
}
