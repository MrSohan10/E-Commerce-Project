import 'package:crafty_bay/reusable/images/assets_path.dart';
import 'package:crafty_bay/view/home/widgets/circle_icon_button.dart';
import 'package:crafty_bay/view/home/widgets/log_out_alert.dart';
import 'package:crafty_bay/view/profile/pages/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar  homeAppBar(context) {
    return AppBar(
      elevation: 0,
      title: Image.asset(AssetsPath.logoNav),
      toolbarHeight: 60,
      backgroundColor: Colors.white,
      actions: [
        CircleIconButton(
          onTap: () {
            Get.to(()=>const UserProfileScreen());
          },
          iconData: Icons.person_outline_outlined,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.call_outlined,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return logOutAlertDialog;
                });
          },
          iconData: Icons.logout_rounded,
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
