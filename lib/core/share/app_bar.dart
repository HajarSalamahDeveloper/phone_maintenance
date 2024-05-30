import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_maintenance/core/share/style_manager.dart';
import 'package:phone_maintenance/core/share/text_widget.dart';

import 'color_manger.dart';
import 'navigator_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.titel, this.actions})
      : super(key: key);
  final String titel;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsetsDirectional.only(start: 20.w, top: 13.h),
        child: TextWidget(
          titel,
          style: getBoldStyle(color: AppColor.fontColor),
        ),
      ),
      leadingWidth: 20,
      leading: Padding(
        padding: EdgeInsetsDirectional.only(start: 10.w, top: 13.h),
        child: BackButton(
          color: AppColor.fontColor,
          onPressed: () {
            NavigatorService.pop();
          },
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
